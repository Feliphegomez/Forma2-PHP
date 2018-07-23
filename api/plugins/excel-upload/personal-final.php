<?php

require('db_config.php');

if(isset($_POST['Submit'])){
	$mimes = ['application/vnd.ms-excel','text/xls','text/xlsx','application/vnd.oasis.opendocument.spreadsheet'];
	if(in_array($_FILES["file"]["type"],$mimes)){
		$json_final = new stdClass();
		$json_final->columnas = new stdClass();
		$json_final->personal = array();
		ini_set('display_errors', 1);
		ini_set('display_startup_errors', 1);
		error_reporting(E_ALL);
		
		$uploadFilePath = 'uploads/'.basename($_FILES['file']['name']);
		move_uploaded_file($_FILES['file']['tmp_name'], $uploadFilePath);
		$Reader = new SpreadsheetReader($uploadFilePath);
		$totalSheet = count($Reader->sheets());
		$html = '';
		$json_final->message = "Tienes un total de ".$totalSheet." hojas, se va utilizar la primera hoja solamente.";

		$Reader->ChangeSheet(0);
		$i=0;
		$r=0;
		foreach ($Reader as $Row){
			foreach($Row As $elem){
				$elem = strtolower(sanear_string($elem));
				if($elem !== ''){
					$json_final->columnas->{$r} = $elem;
					$r = $r+1;
				}
			}
			$i=$i+1;
			if ($i == 1) { break; };
		}
		$i=0;
		foreach($Reader as $Row){
			if(strtolower(sanear_string($Row[0])) !== $json_final->columnas->{0}){
				$arreglo = new stdClass();
				foreach($json_final->columnas As $k=>$v){
					$Row[$k] = isset($Row[$k]) ? $Row[$k] : '';
					$Row[$k] = $Row[$k] !== '-' ? $Row[$k] : '';
					$Row[$k] = ucwords($Row[$k]); #Change Min Text					
					$arreglo->{$v} = $Row[$k];
				}
				$json_final->personal[] = $arreglo;
			}
			
			if(isset($_GET['limit'])){
				$i=$i+1;
				if ($i == $_GET['limit']) { break; };
			}
		}
		
		$json_final->create = newPeopleBD($json_final->columnas, $json_final->personal);
		
		if($json_final->create > 0){
			#header("Location: personal-final.php?aprobar_importacion=true&id=".$json_final->create);
			
			header("Location: ../../../index.php?pageActive=import-people&import=".$json_final->create);
		}
		
		#FINAL -> PRUEBAS
		header('Content-Type: application/json');
		echo json_encode($json_final,JSON_PRETTY_PRINT);
		return json_encode($json_final,JSON_PRETTY_PRINT);
	}else { 
		echo ("<br/>Lo sentimos, el tipo de archivo no está permitido. Solo archivo de Excel."); 
	}

}else if(isset($_GET['aprobar_importacion']) && $_GET['aprobar_importacion'] == true && isset($_GET['id']) && $_GET['id'] > 0 ){
	/*
	
	$sqlConsulta = datosSQL("Select * from ".TBL_UPLOADS_TEMP." where id='{$_GET['id']}'");
	if(isset($sqlConsulta->error) && $sqlConsulta->error == false && $sqlConsulta->data[0]){
		$hoja = $sqlConsulta->data[0];
		$hoja['columnas'] = json_decode($hoja['columnas']);
		$hoja['datos'] = json_decode($hoja['datos']);
		
		$json_final = array();
		
		foreach($hoja['datos'] As $k){
			if(!isset($k->login)){ $k->login = $k->cedula; }
			$arreglo = new stdClass();
			$arreglo->login = $k->login;
			$arreglo->cedula = $k->cedula;
			$arreglo->nombre = $k->nombre;
			$arreglo->user = strtolower($k->login);
			
			$arreglo->cod_cargo = (int) ($k->cod_cargo);
			$arreglo->cargo = (int) cargo_createAlt_newPeopleBD($k->cod_cargo,$k->cargo);
			$arreglo->cargo_name = $k->cargo;
			
			$arreglo->piloto = (int) cliente_createAlt_newPeopleBD($k->cliente);
			$arreglo->piloto_name = ($k->cliente);
			
			$arreglo->estado = (int) estado_createAlt_newPeopleBD($k->estado);
			$arreglo->estado_name = ($k->estado);
			
			$arreglo->supervisor = (int) jefe_createAlt_newPeopleBD($k->ced_jefe_inmediato,$k->jefe_inmediato,$k->cargo_jefe_inmediato);

			$date = str_replace('/', '-', $k->fecha_ingreso);
			$arreglo->fecha_ingreso = date('Y-m-d', strtotime($date));
			$arreglo->create = newPeopleImport($arreglo);
			
			
			$json_final[] = $arreglo;
		}
		#header("Location: ../../../index.php?pageActive=import-people&import=".$_GET['id']);
		
		header('Content-Type: application/json');
		echo json_encode($json_final,JSON_PRETTY_PRINT);
		return json_encode($json_final,JSON_PRETTY_PRINT);
	}else{
		echo "No encontrado";
	}
	*/
}
?>