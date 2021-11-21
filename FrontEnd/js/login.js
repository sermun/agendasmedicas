// cambiar url del backend
const urlmedico = "http://localhost:8080/agendasmedicas/api/loginmedico"
const urlusuario = "http://localhost:8080/agendasmedicas/api/loginusuario"

const tprofesional = document.getElementById('tprofesional');
const clavemedico = document.getElementById('clavemedico');
const loginmedico = document.getElementById('loginmedico');

const docidentidad = document.getElementById('docidentidad');
const claveusuario = document.getElementById('claveusuario');
const loginusuario = document.getElementById('loginusuario');

const datomedico = {
    id_medico:'',
    password:''
}

const datousuario={
    id_paciente:'',
    password:''
}

loginmedico.addEventListener('click', (e)=>{
    e.preventDefault()
    if(tprofesional.value ==''){
        tprofesional.style.cssText = "border-color: red;"
        return;
    }
    if(clavemedico.value ==''){
        clavemedico.style.cssText = "border-color: red;"
        return;
    }

    datomedico.id_medico= tprofesional.value;
    datomedico.password= clavemedico.value;

    console.log(datomedico);
    // datos a formato JSON
    var datomedicojson = JSON.stringify(datomedico);
    console.log(datomedicojson);
    sessionStorage.setItem('datomedico',datomedicojson);

    ////enviar al backend (PROBAR)
    ajax({
        url: urlmedico,
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        success: (res) => location.reload(),
        error: (err) =>
            $form.insertAdjacentHTML("afterend", `<p><b>${err}</b></p>`),
        data:datomedicojson,
    });
})

loginusuario.addEventListener('click', (e)=>{
    e.preventDefault()
    if(docidentidad.value ==''){
        docidentidad.style.cssText = "border-color: red;"
        return;
    }
    if(claveusuario.value ==''){
        claveusuario.style.cssText = "border-color: red;"
        return;
    }

    datousuario.id_paciente= docidentidad.value;
    datousuario.password= claveusuario.value;

    console.log(datousuario);
    // datos a formato JSON
    var datousuariojson = JSON.stringify(datousuario);
    console.log(datousuariojson);
    sessionStorage.setItem('datousuario',datousuariojson);

    ////enviar al backend (PROBAR)
    ajax({
        url: urlusuario,
        method: "POST",
        headers: {
            'Content-Type': 'application/json'
        },
        success: (res) => location.reload(),
        error: (err) =>
            $form.insertAdjacentHTML("afterend", `<p><b>${err}</b></p>`),
        data: datousuariojson,
    });
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

