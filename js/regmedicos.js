
 const tarjetaProf = document.getElementById('tarjetaprof');
 const nombre = document.getElementById('nombre');
 const tipoDoc = document.getElementById('tipodoc');
 const documento = document.getElementById('documento');
 const telefono = document.getElementById('telefono');
 const email = document.getElementById('email');
 const password = document.getElementById('password');

const cancelar = document.getElementById('cancelar');
const registrar = document.getElementById('registrar');

const datos={
    tarjeta:'',
    nombre:'',
    tipodoc:'',
    documento:'',
    telefono:'',
    email:'',
    password:''
}

registrar.addEventListener('click', ()=> {

    if(nombre.value ==''){
        alert('El nombre es obligatorio');
        return;
    }
    datos.tarjeta=tarjetaProf.value;
    datos.nombre=nombre.value;
    datos.tipodoc=tipoDoc.value;
    datos.documento=documento.value;
    datos.telefono=telefono.value;
    datos.email=email.value;
    datos.password=password.value;

    console.log(datos);

    var datosjson=JSON.stringify(datos);
    console.log(datosjson);

    localStorage.setItem('medico',datosjson);

})

cancelar.addEventListener('click', ()=> {

    tarjetaProf.value=''
    nombre.value=''
    tipoDoc.value=''
    documento.value=''
    telefono.value=''
    email.value=''
    password.value=''
})