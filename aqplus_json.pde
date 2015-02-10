JSONObject values, head, results;
JSONArray bindings;

IntList timestamparray = new IntList();
FloatList valueArray = new FloatList();
FloatList longArray = new FloatList();
FloatList latArray = new FloatList();
StringList sensorlist = new StringList();

String[] vars;

String sensor1 = "uri://opensheffield.org/datagrid/sensors/Groundhog1/LD-Groundhog1_SO2_15min.ic";
String sensor2 = "uri://opensheffield.org/datagrid/sensors/Groundhog3/LD-Groundhog3_SO2_15min.ic";
String sensor3 = "uri://opensheffield.org/datagrid/sensors/Groundhog3/LD-Groundhog3_PM10_Gravimetric.ic";
String sensor4 = "uri://opensheffield.org/datagrid/sensors/Groundhog3/LD-Groundhog3_NO2.ic";
String sensor5 = "uri://opensheffield.org/datagrid/sensors/Groundhog1/LD-Groundhog1_Pressure.ic";
String sensor6 = "uri://opensheffield.org/datagrid/sensors/Groundhog1/LD-Groundhog1_PM10_Gravimetric.ic";
String sensor7 = "uri://opensheffield.org/datagrid/sensors/Groundhog1/LD-Groundhog1_NO2.ic";
String sensor8 = "uri://opensheffield.org/datagrid/sensors/Groundhog2/LD-Groundhog2_PM2.5.ic";
String sensor9 = "uri://opensheffield.org/datagrid/sensors/Groundhog2/LD-Groundhog2_PM10_Gravimetric.ic";
String sensor10 = "uri://opensheffield.org/datagrid/sensors/Groundhog2/LD-Groundhog2_NO2.ic";

String url = "http://apps.opensheffield.org/sparql?default-graph-uri=&query=select+%3Fsensor%2C+%3Ftimestamp%2C+%3FobservationValue%2C+%3Flat%2C+%3Flong%0D%0Awhere+%7B%0D%0A++++%3Fobservation+%3Chttp%3A%2F%2Fpurl.oclc.org%2FNET%2Fssnx%2Fssn%23hasValue%3E+%3FobservationValue+.%0D%0A++++%3Fobservation+%3Chttp%3A%2F%2Fpurl.oclc.org%2FNET%2Fssnx%2Fssn%23endTime%3E+%3Ftimestamp+.%0D%0A++++%3Fobservation+%3Curi%3A%2F%2Fopensheffield.org%2Fproperties%23sensor%3E+%3Fsensor+.%0D%0A++++%3Fsensor+%3Chttp%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23lat%3E+%3Flat+.%0D%0A++++%3Fsensor+%3Chttp%3A%2F%2Fwww.w3.org%2F2003%2F01%2Fgeo%2Fwgs84_pos%23long%3E+%3Flong+.%0D%0A%0D%0A%0D%0A++++%7B%0D%0A++++++++select+%28max%28%3Fr%29+AS+%3Fobservation%29%0D%0A++++++++where+%7B%0D%0A++++++++++++%3Fr+a+%3Chttp%3A%2F%2Fpurl.oclc.org%2FNET%2Fssnx%2Fssn%23ObservationValue%3E+.%0D%0A++++++++++++%3Fr+%3Curi%3A%2F%2Fopensheffield.org%2Fproperties%23sensor%3E+%3Fsensor+.%0D%0A++++++++%7D%0D%0A++++++++GROUP+BY+%3Fsensor%0D%0A++++%7D%0D%0A%7D&format=application%2Fsparql-results%2Bjson&timeout=0&debug=on";


static final int TIME_PERIOD = 15;

void setup() {

  size(400, 400);
 
  updateVars();
}

void draw() {
  background(0);
  int time = minute() % TIME_PERIOD;
  if(time == 0) updateVars();
  
  println("-------------------------------------------");
  for(int i = 0; i < timestamparray.size(); i++){
    if(timestamparray.get(i) == 2015){
      
      print(sensorlist.get(i));
      print(" | ");
      
     

      
      print(timestamparray.get(i));
      print(" | ");
      
      print(valueArray.get(i));
      print(" | ");
      
      print(longArray.get(i));
      print(" | ");
      
      print(latArray.get(i));
      print(" | ");
      println();
      
      if ((sensorlist.get(i).equals(sensor1)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,20);  
      }
      
      if ((sensorlist.get(i).equals(sensor2)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,40);
    }
    
      if ((sensorlist.get(i).equals(sensor3)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,60);
    }
    
      if ((sensorlist.get(i).equals(sensor4)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,80);
    }
    
      if ((sensorlist.get(i).equals(sensor5)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      float m = map((valueArray.get(i)), 0, 1000, 0, 20);
      text(m, 20 ,100);
    }
    
       if ((sensorlist.get(i).equals(sensor6)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,120);
    }
    
       if ((sensorlist.get(i).equals(sensor7)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,140);
    }
    
       if ((sensorlist.get(i).equals(sensor8)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,160);
    }
    
       if ((sensorlist.get(i).equals(sensor9)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,180);
    }
    
       if ((sensorlist.get(i).equals(sensor10)==true) && (timestamparray.get(i) == 2015)) {
      fill(255); 
      text((valueArray.get(i)), 20 ,200);
    }
       
    }
  }
  println("-------------------------------------------");
  
}

void updateVars(){
  
  values = loadJSONObject(url);

  head = values.getJSONObject("head");
  results = values.getJSONObject("results");
  vars = head.getJSONArray("vars").getStringArray();
  bindings = results.getJSONArray("bindings");
  
  timestamparray.clear();
  valueArray.clear();
  longArray.clear();
  latArray.clear();
  sensorlist.clear();

  for (int i = 0; i < bindings.size (); i++) {
    JSONObject binding = bindings.getJSONObject(i);
    for (int j = 0; j < vars.length; j++) {
      JSONObject item = binding.getJSONObject(vars[j]);
      if (vars[j].equals("timestamp")) {
        String val = item.getString("value").substring(0, 4);
        int timestamp = Integer.parseInt(val);      
        timestamparray.append(timestamp);
      } else if (vars[j].equals("sensor")) {
        String sensor = item.getString("value");
        sensorlist.append(sensor);
      } else if (vars[j].equals("observationValue")) {
        float observationValue = Float.parseFloat(item.getString("value"));
        valueArray.append(observationValue);
      } else if (vars[j].equals("lat")) {
        float lat = Float.parseFloat(item.getString("value"));
        latArray.append(lat);
      } else if (vars[j].equals("long")) {
        float longitude = Float.parseFloat(item.getString("value"));
        longArray.append(longitude);
      }
    }
  }
}
