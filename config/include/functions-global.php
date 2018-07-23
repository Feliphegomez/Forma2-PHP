<?php 

### Detectar Pagina activa
function pageActive(){
	$r = false;
	if(isset($_GET) && isset($_GET['pageActive']) && $_GET['pageActive'] !== ''){
		$r = strtolower($_GET['pageActive']);
	}
	return $r; 
};


/* 	------------------------------------------------------------
		######## FUNCIONES DENTRO DE LA PAGINA #######
	------------------------------------------------------------
*/

### Validar si hay un Action Form activo
if(isset($_POST) && isset($_POST['action_forms']) && $_POST['action_forms'] !== ''){
	### Comenzar con newCategory
	if(
		$_POST['action_forms'] == 'newCategory'
		&& isset($_POST['name']) && $_POST['name'] !== ''
		&& isset($_POST['raiz']) && $_POST['raiz'] !== ''
		&& isset($_POST['piloto']) && $_POST['piloto'] !== ''
		&& isset($_POST['type']) && $_POST['type'] !== ''
		&& isset($_POST['view']) && $_POST['view'] !== ''
		&& isset($_POST['icon']) && $_POST['icon'] !== ''
	){
		unset($_POST['action_forms']);
		
		$command = "INSERT INTO ".TBL_CATEGORIES." ( name,raiz,piloto,type,view,icon ) VALUES (?,?,?,?,?,?)";
		$create = crearSQL($command,array($_POST['name'],$_POST['raiz'],$_POST['piloto'],$_POST['type'],$_POST['view'],$_POST['icon']));
		if(isset($create->error) && $create->error == false){
			header("Location: index.php?pageActive=explore-forum&type=forum&of=".$_POST['raiz']);
			exit("Categoria creada...");
		}else{
			header("Location: ".$_SERVER['HTTP_REFERER']);
			exit("Error Creando la categoria..");
		}
		
		exit("");
	}
}
