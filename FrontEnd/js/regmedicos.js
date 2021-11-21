// cambiar url del backend
const url = "http://localhost:8080/agendasmedicas/api/medicos"

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
    id_medico:'',
    nombre:'',
    tipo_doc:'',
    doc_identidad:'',
    telefono:'',
    email:'',
    password:''
}

registrar.addEventListener('click', (e)=> {
    e.preventDefault()
    if(nombre.value ==''){
        alert('El nombre es obligatorio');
        return;
    }
    datos.id_medico=tarjetaProf.value;
    datos.nombre=nombre.value;
    datos.tipo_doc=tipoDoc.value;
    datos.doc_identidad=documento.value;
    datos.telefono=telefono.value;
    datos.email=email.value;
    datos.password=password.value;

    console.log(datos);

    var datosjson=JSON.stringify(datos);
    console.log(datosjson);

    localStorage.setItem('medico',datosjson);

    ////enviando datos al backend (PROBAR)
    ajax({
        url: url,
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        success: (res) => location.reload(),
        error: (err) =>
            $form.insertAdjacentHTML("afterend", `<p><b>${err}</b></p>`),
        data: datosjson,
    });
})

cancelar.addEventListener('click', ()=> {

    tarjetaProf.value=''
    nombre.value=''
    tipoDoc.value=''
    documento.value=''
    telefono.value=''
    email.value=''
    password.value=''

    localStorage.removeItem('medico');
})

const ajax = (options) => {
    let { url, method, success, error, data } = options;
    const xhr = new XMLHttpRequest();

    xhr.addEventListener("readystatechange", (e) => {
        if (xhr.readyState !== 4) return;

        if (xhr.status >= 200 && xhr.status < 300) {
            let json = JSON.parse(xhr.responseText);
            success(json);
        } else {
            let message = xhr.statusText || "Ocurrió un error";
            error(`Error ${xhr.status}: ${message}`);
        }
    });

    xhr.open(method || "GET", url);
    xhr.setRequestHeader("Content-type", "application/json; charset=utf-8");
    xhr.send(JSON.stringify(data));
};

