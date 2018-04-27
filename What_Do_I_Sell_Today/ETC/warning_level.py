import json
import urllib.request
import urllib.parse
import pymysql

url = 'https://golmok.seoul.go.kr/sgmc/trdarstatis/get_RPCT030400.json'

with open('warning_Level_JSON.txt', 'w', encoding='utf-8') as json_file:
   with urllib.request.urlopen(url) as f:
      json_file.write(f.read().decode('UTF-8'))

with open('warning_Level_JSON.txt', 'r', encoding='utf-8') as json_file:
   data = json.load(json_file)

with open('warning_Level_Result.txt', 'w', encoding='utf-8') as json_file:
   for temp in data:
      json_file.write(temp['signguNm']+","+temp['riskIdexValue']+","+temp['thsyyClsbizRt']+"\n")

conn = pymysql.connect(host='70.12.109.53', port=3306, user='root', passwd='bigdata', db='project', charset ='utf8')
cur = conn.cursor()

i = 1
for temp in data :
   sql = "INSERT INTO WARNINGLEVEL (num, area, level, fail) VALUES ("+str(i)+","+"\'"+temp['signguNm']+"\'"+","+"\'"+temp['riskIdexValue']+"\'"+","+temp['thsyyClsbizRt']+")"
   print(sql)
   try:
      cur.execute(sql)
      conn.commit()
   except:
      conn.rollback()
   i += 1

cur.close()
conn.close()
