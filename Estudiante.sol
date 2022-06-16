// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Estudiante{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping (string => uint8) private _notas_materias;
    string[] private _materias;
    
    constructor(string memory nombre_, string memory apellido_, string memory curso_){
        _nombre = nombre_;
        _apellido = apellido_;
        _curso = curso_;
        _docente = msg.sender;
    }

    function apellido() public view returns(string memory){
        return _apellido;
    }

    function nombre_completo() public view returns(string memory){
        return string(bytes.concat(bytes(_nombre)," ", bytes(_apellido)));
    }

    function curso() public view returns(string memory){
        return _curso;
    }
    
    function set_nota_materia(uint8 nota_, string memory materia_) public{
        require(msg.sender == _docente, "Solo el docente del alumno puede cambiar las notas");
        require(nota_ <= 100, "La nota tiene que ser del 1 al 100");
        require(nota_ >= 1, "La nota tiene que ser del 1 al 100");

        bool existe = false;
        for(uint8 i = 0; i < _materias.length; i++){
            if (keccak256(abi.encodePacked(_materias[i])) == keccak256(abi.encodePacked(materia_))){
            
                existe = true;
            }
        }
        if(!existe){
            _materias.push(materia_);
        }
        _notas_materias[materia_] = nota_;
    }
    
    function nota_materia(string memory materia_)public view returns(uint){
        return _notas_materias[materia_];
    }
    
    function aprobo(string memory materia_)public view returns(bool){
        if (_notas_materias[materia_] >= 60){
            return true;
        }
        else{
            return false;
        }
    }
