import mysql.connector
import pytz
import datetime
import json
from flask import Flask, request, jsonify
from math import sin, cos, atan2, sqrt, radians
from datetime import date, timedelta
from random import randint

conn = mysql.connector.connect(host = 'localhost', database = 'shippingapiv2', password = 'mydb2023', user = 'root')

tz = pytz.timezone('Asia/Jakarta')

def calc_distance(ltt1, long1, ltt2, long2):
    R = 6373.0

    lat1 = radians(ltt1)
    lon1 = radians(long1)
    lat2 = radians(ltt2)
    lon2 = radians(long2)

    dlon = lon2 - lon1
    dlat = lat2 - lat1

    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))

    distance = R * c
    result = round(distance, 2)

    return result

def getResi():
    resi = randint(100000000, 999999999)

    return resi

def estimated_time(service):

    if service == 1:
        estimated_time = datetime.datetime.now(tz=tz) + timedelta(days=2)
    elif service == 2:
        estimated_time = datetime.datetime.now(tz=tz) + timedelta(days=4)

    result = estimated_time.strftime('%Y-%m-%d')

    return result

def ctc_ongkir(weight, unit):
    totalWeight = round(weight*unit)
    price = 8000

    ongkir = price*totalWeight

    return ongkir

def reg_ongkir(distance, weight, unit):
    totalWeight = round(weight*unit)

    if distance > 30 and distance <= 120:
        price = 12000
        ongkir = price*totalWeight
        return ongkir
    elif distance > 120 and distance < 5500:
        price = 12000
        ongkir = (price +(1000*round((distance-120)/35)))*totalWeight
        return ongkir
    else:
        return "Invalid distance!"       

app = Flask(__name__)

@app.route('/services', methods=['GET'])
def home():
    try:
        mycursor = conn.cursor()
        mycursor.execute("SELECT * from services")
        
        column = [i[0] for i in mycursor.description]

        data= []
        myresult = mycursor.fetchall()

        for row in myresult:
            data.append(dict(zip(column, row)))

        return jsonify({"Message" : "Succesfully retrieved data!", "data" : data})
    
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close() 

@app.route('/ongkir', methods=['GET'])
def ongkir():
    try:
        mycursor = conn.cursor()
        sql = ("SELECT lat, lon from kota where idKota in (%s, %s)")
        var = (request.args['from'], request.args['to'])
        weight = float(request.args['weight'])

        mycursor.execute(sql, var)

        myresult = mycursor.fetchall()  

        rowCount = len(myresult)

        if rowCount == 0:
            return jsonify({"message" : "Kota tidak ditemukan, silahkan masukkan id kota yang valid"})

        latlist = []

        for i in myresult:
            for j in i:
                latlist.append(j) 

        lat1 = latlist[0]
        lon1 = latlist[1]
        lat2 = latlist[2]
        lon2 = latlist[3]

        dist = calc_distance(lat1, lon1, lat2, lon2)

        if dist <= 30 and dist >= 0:
            result = ctc_ongkir(weight,1)
            at = estimated_time(1)
        else:
            result = reg_ongkir(dist,weight,1)
            at = estimated_time(2)

        return jsonify({"tarif" : result, "estimated arrival" : at})
    
    except IndexError:
        return jsonify({"tarif" : ctc_ongkir(weight, 1), "estimated arrival" : estimated_time(1)})
    
    except Exception as e:
        print(e)   

    mycursor.close() 
    conn.close()   

@app.route('/category', methods=['GET'])
def category():
    try:
        mycursor = conn.cursor()
        mycursor.execute("SELECT * from category")
        
        column = [i[0] for i in mycursor.description]

        data= []
        myresult = mycursor.fetchall()

        for row in myresult:
            data.append(dict(zip(column, row)))

        return jsonify({"Message" : "Succesfully retrieved data!", "data" : data})
    
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close()   

@app.route('/kota', methods=['GET'])
def kota():
    try:
        mycursor = conn.cursor()
        mycursor.execute("SELECT kota.idKota, kota.kota, provinsi.provinsi from kota JOIN provinsi ON kota.kodeProvinsi = provinsi.kodeProvinsi")
        
        column = [i[0] for i in mycursor.description]

        data= []
        myresult = mycursor.fetchall()

        for row in myresult:
            data.append(dict(zip(column, row)))

        return jsonify({"Message" : "Succesfully retrieved data!", "data" : data})
    
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close()  

@app.route('/shipmentDetails', methods=['GET'])
def shipmentDetails():
    try:
        if 'no_resi' in request.args:
            mycursor = conn.cursor()
            sql = "select * from shipment where no_resi = %s"
            var = (request.args['no_resi'],)
            mycursor.execute(sql, var)

            column = [i[0] for i in mycursor.description]

            data= []
            myresult = mycursor.fetchall()

            rowCount = len(myresult)

            if rowCount == 0:
                return jsonify({"message" : "Paket tidak ditemukan, silahkan masukkan nomor resi yang valid!"})

            for row in myresult:
                data.append(dict(zip(column, row)))

            return jsonify({"Message" : "Succesfully retrieved data!", "data" : data})
    
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close()  

@app.route('/shipment', methods=['POST'])
def shipment():
    try:

        mycursor = conn.cursor()

        no_resi = getResi()
        serviceId = request.json['serviceId']
        created_at = datetime.datetime.now().strftime('%Y-%m-%d')
        ongkir = request.json['ongkir']
        kurirId = randint(1,5)
        receiver = request.json['receiver']
        recPhoneNum = request.json['recPhoneNum']
        toAddress = request.json['toAddress']
        toKota = request.json['toKota']
        sender = request.json['sender']
        sendPhoneNum = request.json['sendPhoneNum']
        fromKota = request.json['fromKota']
        weight = request.json['weight']
        ctgId = request.json['ctgId']
        fragile = request.json['fragile']
        estimated_arrived = request.json['estimated_arrived']

        sql = "INSERT INTO shipment (no_resi, serviceId, created_at, ongkir, kurirId, receiver, recPhoneNum, toAddress, toKota, sender, sendPhoneNum, fromKota, weight, ctgId, fragile, estimated_arrived) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
        var = (no_resi, serviceId, created_at, ongkir, kurirId, receiver, recPhoneNum, toAddress, toKota, sender, sendPhoneNum, fromKota, weight, ctgId, fragile, estimated_arrived)

        mycursor.execute(sql, var)

        conn.commit()

        return jsonify({"message" : "data added successfully!", "no_resi" : no_resi})
        
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close()   

@app.route('/checkStatus', methods=['GET'])
def checkStatus():
    try:
        if 'no_resi' in request.args:
            mycursor = conn.cursor()
            sql = "select shipment.no_resi, status.status from shipment join status on shipment.statusId = status.statusId where no_resi = %s"
            var = (request.args['no_resi'],)
            mycursor.execute(sql, var)

            column = [i[0] for i in mycursor.description]

            data= []
            myresult = mycursor.fetchall()

            for row in myresult:
                data.append(dict(zip(column, row)))

            return jsonify({"Message" : "Succesfully retrieved data!", "data" : data})
        
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close() 

@app.route('/changeStatus', methods=['PATCH'])
def changeStatus():
    try:
        if 'no_resi' in request.args:
            mycursor = conn.cursor()

            sql = "UPDATE shipment SET statusId = %s WHERE no_resi = %s"
            var = (request.args['statusId'], request.args['no_resi'])

            mycursor.execute(sql, var)

            conn.commit()

            return jsonify({"message" : "status updated successfully!"})
        
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close() 

@app.route('/updateShipment', methods=['PUT'])
def updateShipment():
    try:
        if 'no_resi' in request.args:
            mycursor = conn.cursor()
            data = request.get_json()

            sql = "UPDATE shipment SET serviceId = %s , created_at = %s , ongkir = %s , kurirId = %s , receiver = %s , recPhoneNum = %s , toAddress = %s , toKota = %s , sender = %s , sendPhoneNum = %s , fromKota = %s , weight = %s , ctgId = %s , fragile = %s , estimated_arrived = %s , statusId = %s  WHERE no_resi = %s"
            var = (data['serviceId'], data['created_at'], data['ongkir'], data['kurirId'], data['receiver'], data['recPhoneNum'], data['toAddress'], data['toKota'], data['sender'], data['sendPhoneNum'], data['fromKota'], data['weight'], data['ctgId'], data['fragile'], data['estimated_arrived'], data['statusId'], request.args['no_resi'])

            mycursor.execute(sql, var)

            conn.commit()

            return jsonify({"message" : "shipment updated successfully!"})
        
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close()  

@app.route('/deleteShipment', methods=['DELETE'])
def deleteShipment():
    try:
        if 'no_resi' in request.args:
            mycursor = conn.cursor()
            sql = "DELETE from shipment where no_resi = %s"
            var = (request.args['no_resi'],)
            mycursor.execute(sql, var)

            conn.commit()

            return jsonify({"message" : "data deleted successfully!"})
            
    except Exception as e:
        print(e) 

    mycursor.close() 
    conn.close() 
    

if __name__ == '__main__':
    app.run(debug=True)