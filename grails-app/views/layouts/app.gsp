<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title><g:layoutTitle default="Grails"/></title>
        
        <asset:stylesheet src="app.css"/>
	<!--<asset:javascript src="application.js"/>-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> <!-- Ejemplo de CDN de Google -->
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css"/>
        <script type="text/javascript" src="//cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-light bg-nav">
            <div class="container-fluid">
                <a class="navbar-brand">IFREM</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" home" href="${createLink(uri: '/')}">Inicio</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">M. actividades</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><g:link class="dropdown-item" controller="Estatus" action="index">Estatus</g:link></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><g:link class="dropdown-item" controller="Empleados" action="index">Empleados</g:link></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><g:link class="dropdown-item" controller="TipoActividad" action="index">Tipo de actividad</g:link></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><g:link class="dropdown-item" controller="Actividades" action="index">Actividades</g:link></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><g:link class="dropdown-item" controller="detalleActividades" action="index">Relación de actividades</g:link></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- Layout Body -->
        <main class="py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <g:layoutBody/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- Footer -->
        <footer class="text-center text-lg-start bg-body-tertiary text-muted">
            <section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom bg-footer">
                <div class="me-5 d-none d-lg-block"></div>
                
                <div>
                    <a href="" class="me-4 text-reset">
                        <i class="fa-brands fa-facebook" style="color: #FFF"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fa-brands fa-square-x-twitter" style="color: #FFF"></i>
                    </a>
                </div>
            </section>

            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-6 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4"><i class="fa-solid fa-building"></i> IFREM</h6>
                            <p>Instituto de la Función Registral del Estado de México.</p>
                            <hr>
                            <p>
                                Dr. Nicolás S. Juan, <br/>
                                Ex Hacienda La Magdalena, 50010 Toluca de Lerdo, Méx.
                            </p>
                        </div>

                        <div class="col-md-9 col-lg-3 col-xl-6 mx-auto mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4"><i class="fa-solid fa-computer"></i> Unidad de Informática</h6>
                            <p>Departamento de Desarrollo</p>
                            <hr>
                            <p>
                                <b>Tel:</b> (01) 722 236 2909 <br/>
                                <b>Ext.:</b> 54019, 54110, 54062, 54174, 54151, 54015, 54037, 54014, 54150 <br/>
                                <b>Email:</b> depto.desarrollo@ifrem.gob.mx
                            </p>
                        </div>
                    </div>
                </div>
            </section>
          
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © Copyright <a class="text-reset fw-bold" href="https://ifrem.edomex.gob.mx/" target="_target">IFREM</a> 2025
            </div>
        </footer>
    </body>
</html>
