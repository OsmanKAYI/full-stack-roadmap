<script setup>

// What you have
var officers = [
  { id: 20, name: 'Captain Piett' },
  { id: 24, name: 'General Veers' },
  { id: 56, name: 'Admiral Ozzel' },
  { id: 88, name: 'Commander Jerjerrod' }
];// What you need

/*
var officersIds = [];
 
officers.forEach(function (officer) {
  officersIds.push(officer.id);
});
 
// or

for(let i=0; i<officers.length;i++) {
  officersIds.push(officers[i].id);
};
 
//or

for(const officer of officers) {
  officersIds.push(officer.id);
}
*/



/*
var officersIds = officers.map(function (officer) {
  return officer.name
});
const officersIds = officers.map(officer => officer.id);
const officersIds = officers.map(x => x.id);
 
  
var officersIds = officers.map(function (officer) {
  return officer.id * officer.id
});
const officersIds = officers.map(officer => officer.id * officer.id );
const officersIds = officers.map(x => x.id * x.id);
*/



/*
var officersIds = officers.map(function (officer, index) {
  if(index < officer.id) {
    return officer.name
  } else {
    return officer.id
  }
});
 

const officersIds = officers.map( (officer, index) => {
  if(index < officer.id) {
    return officer.name
  } else {
    return officer.id
  }
 
});
*/



/*
const officersIds = officers.map(officer => {
 
  if(officer.types.lenght == 0) return "";
  if(officer.types.lenght == 1) return officer.types[0];
  
  let myTypes = []
  for(type of officer.types) {
    myTypes.push(type)
  }
  return myTypes;
 
}
);
*/



/*
const officersIds = officers.map(officer => {
  officer.types.map(xx => xx)
});
*/

</script>
  
  
<template>
  <pre>{{ officersIds }}</pre>
</template>
  