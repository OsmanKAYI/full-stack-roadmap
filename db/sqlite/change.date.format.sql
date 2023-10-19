SELECT
(substr(date,7,4)||'-'||substr(date,4,2)||'-'||substr(date,1,2)||' '||time||';'||value) as DEGER
FROM sensor 
WHERE sensorType = 'lux' -- lux, temp, humid