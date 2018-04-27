import json
import urllib.request
import urllib.parse
import pymysql

# 한식 svcIndutyCd=CS100001
# 중국집 svcIndutyCd=CS100002
# 일식 svcIndutyCd=CS100003
# 양식집 svcIndutyCd=CS100004
# 분식집 svcIndutyCd=CS100005
# 패스트푸드 svcIndutyCd=CS100006
# 치킨집 svcIndutyCd=CS100007
# 제과점 svcIndutyCd=CS100008
# 커피 svcIndutyCd=CS100009
# 호프집 svcIndutyCd=CS100010
# 강남구 signguCd=11680
# 강북구 signguCd=11305
# 강동구 signguCd=11740
# 강서구 signguCd=11500
# 관악구 signguCd=11620
# 광진구 signguCd=11215
# 구로구 signguCd=11530
# 금천구 signguCd=11545
# 노원구 signguCd=11350
# 도봉구 signguCd=11320
# 동대문구 signguCd=11230
# 동작구 signguCd=11590
# 마포구 signguCd=11440
# 서대문구 signguCd=11410
# 서초구 signguCd=11650
# 성동구 signguCd=11200
# 성북구 signguCd=11290
# 송파구 signguCd=11710
# 양천구 signguCd=11470
# 영등포구 signguCd=11560
# 용산구 signguCd=11170
# 은평구 signguCd=11380
# 종로구 signguCd=11110
# 중구 signguCd=11140
# 중랑구 signguCd=11260

species_name = ["한식","중국집","일식","양식집","분식집","패스트푸드","치킨집","제과점","커피","호프집"]
species_code = ["CS100001","CS100002","CS100003","CS100004","CS100005","CS100006","CS100007","CS100008","CS100009","CS100010"]
area_name = ["강남구","강북구","강동구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"]
area_code = [11680,11305,11740,11500,11620,11215,11530,11545,11350,11320,11230,11590,11440,11410,11650,11200,11290,11710,11470,11560,11170,11380,11110,11140,11260]

conn = pymysql.connect(host='70.12.109.53', port=3306, user='root', passwd='bigdata', db='project', charset ='utf8')
cur = conn.cursor()

j = 0
count = 1
for species in species_code :
    i = 0
    for area in area_code :
        url = "https://golmok.seoul.go.kr/sgmc/trdarstatis/get_rpct0203.json?svcIndutyCd="+species+"&upperSvcIndutyCd=CS100000&stdrYmCd=201802&signguEmdGb=signgu&svcStdrMm=02&signguCd="+str(area)+"&adstrdCd="
        with open(area_name[i]+"_"+species_name[j]+'_sales_json.txt', 'w', encoding='utf-8') as json_file:
           with urllib.request.urlopen(url) as f:
              json_file.write(f.read().decode('UTF-8'))

        with open(area_name[i]+"_"+species_name[j]+'_sales_json.txt', 'r', encoding='utf-8') as json_file:
           data = json.load(json_file)

        # with open(area_name[i]+"_"+species_name[j]+'_sales_result.txt', 'w', encoding='utf-8') as json_file:
        #     for temp in data['rpct020311']['rows']:
        #         print(area_name[i]+", "+species_name[j]+", "+temp['stdrYmCd'] + ", " + str(temp['signguSelngAmt']) + ", " + str(temp['allSelngAmt'])+"\n")
        for temp in data['rpct020311']['rows']:
            sql = "INSERT INTO SALES (NUM, AREA, SALE_SPECIES, QUARTERS, AREA_SALES, SEOUL_SALES) VALUES (" + str(count) + "," +"\'"+ area_name[i] +"\'"+","+"\'"+ species_name[j] +"\'"+ "," + str(temp['stdrYmCd']) + "," + str(temp['signguSelngAmt']) + "," + str(temp['allSelngAmt']) + ")"
            try:
                cur.execute(sql)
                conn.commit()
                print(sql)
            except:
                conn.rollback()
                print("SQL 에러")
            count += 1
        i += 1
    j += 1

cur.close()
conn.close()