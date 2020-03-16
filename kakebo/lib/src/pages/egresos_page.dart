import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:kakebo/src/models/ingresos_egresos_model.dart';
import 'package:kakebo/src/providers/movimientos_info.dart';
import 'package:kakebo/src/utils/formatter_utils.dart';

class EgresosPage extends StatefulWidget {
 
  static String name = 'egresos'; 

  @override
  _EgresosPageState createState() => _EgresosPageState();
}

class _EgresosPageState extends State<EgresosPage> {

  String _opcionSeleccionada = 'Indispensable';
  String _fecha  = '';

  List<String> _categorias = ['Indispensable', 'Ocio/Vicios', 'Cultura/Educación','Pago de Créditos Revolvente/MSI', 'Extras/Otros'];
  bool validMonto = true, validConcepto = true, validFecha = true;
  TextEditingController _inputFieldDateController = new TextEditingController();
  IngresosEgresosModel objIngresos = IngresosEgresosModel();

  @override
  Widget build(BuildContext context) {
    objIngresos.categoria = objIngresos.categoria == null ? _categorias[0]: objIngresos.categoria;

    final movimientosInfo = Provider.of<MovimientosInfo>(context);
    
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Egresos'),
             backgroundColor: Colors.teal,
            ),
          
          body:  Center(            
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: <Widget>[
                    SizedBox(height: 20.0,),
                    _crearDropdown(),
                    Divider(),
                    _ingresarMonto(),
                    Divider(),
                    _ingresarConcepto(),
                     Divider(),
                    _crearFecha( context ),
                    Divider(),
                    _botonGuardar(movimientosInfo)
              ]
            )
          )
        )
      );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {

    List<DropdownMenuItem<String>> lista = new List();

    _categorias.forEach( (categoria){

      lista.add( DropdownMenuItem(
        child: Text(categoria),
        value: categoria,
      ));

    });

    return lista;

  }

  Widget _crearDropdown() {
    TextStyle txt = TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.blueGrey);
    return Column(
      children: <Widget>[
             Row(
              children: <Widget>[Text("Seleccione categoría:",style: txt,)]),
            Row(
              children: <Widget>[
                Icon(Icons.business_center),
                SizedBox(width: 30.0),
                Expanded(
                  child: DropdownButton(
                    value: _opcionSeleccionada,
                    items: getOpcionesDropdown(),
                    onChanged: (opt) {
                      setState(() {
                        _opcionSeleccionada = opt;
                      });
                    },
                  ),
                )
            ],
          )
      ],
    );
  }

  Widget _ingresarMonto(){
        return TextField(

          textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  labelText: 'Monto',
                  helperText: 'Agregar cantidad de dinero ingresada',
                  icon: Icon(  Icons.attach_money),
                  errorText:  validMonto ? null:"Favor de ingresar monto"
                ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                            inputFormatters: <TextInputFormatter>[
                    DecimalTextInputFormatter(decimalRange: 2)
                ],
                onChanged: (valor){
                  setState(() {
                    objIngresos.monto = valor=="" ? null : double.parse(valor);
                    validMonto =true;
                  });
                },
        );
  }
  
  Widget _ingresarConcepto(){
        return TextField(

          textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  labelText: 'Concepto',
                  icon: Icon(  Icons.attach_money),
                  errorText:  validConcepto ? null:"Favor de ingresar Concepto",
                ),
                onChanged: (valor){
                setState(() {
                    objIngresos.concepto = valor;
                    validConcepto =true;
                  });
                },
        );
  }

  Widget _crearFecha( BuildContext context ) {

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Seleccione fecha',
        labelText: 'Seleccione fecha',
        icon: Icon( Icons.calendar_today ),
        errorText:  validFecha ? null:"Favor de ingresar Fecha",
      ),
      onTap: (){ 

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );

      },
    );

  }

   _selectDate(BuildContext context) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2100),
      locale: Locale('es', 'ES'),

    );

    if ( picked != null ) {
      setState(() {
          _fecha = DateFormat('dd-MM-yyyy' ).format(picked); 
          _inputFieldDateController.text = _fecha;
          objIngresos.fecha = picked.toString();
          validFecha =true;
      }); 
    }

  }

  Widget _botonGuardar(MovimientosInfo movimientosInfo){
    TextStyle  style = TextStyle(fontSize: 35.0, color: Colors.white);
    return ButtonTheme(
        minWidth: 200.0,
        child:RaisedButton(
          padding: EdgeInsets.symmetric(horizontal:10.0, vertical :5.0),
            child: Text("Guardar", style: style),
            color: Colors.teal, 
            shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Color(0xff1a237e))),              
            onPressed: (){
               if(!_validarCamposVacios(objIngresos)){
                objIngresos.tipo ="-";
                movimientosInfo.agregarMoviento(objIngresos);   
              }
            }
        )
      );
  }

  bool _validarCamposVacios(IngresosEgresosModel objIngresos){
      bool bAllOk = false;
      if(objIngresos.categoria.toString().length == 0 || objIngresos.categoria == null){
        bAllOk =true;
      }
      if(objIngresos.concepto.toString().length == 0 || objIngresos.concepto == null){
         setState(() {
          validConcepto = false;
        }); 
        
        bAllOk =true;
      }
      if(objIngresos.fecha.toString().length == 0 || objIngresos.fecha == null){
         setState(() {
          validFecha = false;
        }); 
        bAllOk =true;
      }
      
      if(objIngresos.monto.toString().length == 0 || objIngresos.monto == null){
        setState(() {
          validMonto = false;
        }); 
        bAllOk = true;
      }

    
      return bAllOk;
  }
}