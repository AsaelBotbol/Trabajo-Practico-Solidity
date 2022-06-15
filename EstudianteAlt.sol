// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract Estudiante{
    string private _nombre;
    string private _apellido;
    string private _curso;
    address private _docente;
    mapping(uint8 => mapping(string => uint8)) private _notas_materias;
    string[] private _materias;
    mapping (address => bool) _permisos;
    
    event SetNota(address docente, string materia, uint8 bimestre, uint8 nota);

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
