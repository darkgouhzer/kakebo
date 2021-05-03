import 'package:flutter/material.dart';
import 'package:kakebo/src/models/ingresos_egresos_model.dart';
import 'package:kakebo/src/providers/movimientos_info.dart';
import 'package:kakebo/src/widgets/button_widget.dart';
import 'package:kakebo/src/widgets/slidable_widget.dart';
import 'package:provider/provider.dart';
import 'package:kakebo/src/utils/utils.dart';
import 'package:intl/intl.dart';

class MovimientosPage extends StatefulWidget {
  static String name = 'reportes';

  @override
  _MovimientosPageState createState() => _MovimientosPageState();
}

class _MovimientosPageState extends State<MovimientosPage> {
  DateTimeRange dateRange;
  TextEditingController _inputFieldDateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final movimientosInfo = Provider.of<MovimientosInfo>(context);
    List<IngresosEgresosModel> items = movimientosInfo.movimientos;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Movimientos'),
              backgroundColor: Colors.deepOrange,
            ),
            body: Center(
              child: _listaMovimientos(items, movimientosInfo),
            )));
  }

  Widget _listaMovimientos(
      List<IngresosEgresosModel> items, MovimientosInfo movimientosInfo) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text("Filtros"),
          filtros(context),
          Expanded(
              child: ListView.separated(
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final item = items[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: SlidableWidget(
                    child: buildListTile(item),
                    onDismissed: (action) => dismissSlidableItem(
                        context, index, action, movimientosInfo, item.id),
                  )),
                ],
              );
            },
          )),
          Text("Total"),
        ]);
  }

  String getFrom() {
    if (dateRange == null) {
      return 'From';
    } else {
      return DateFormat('dd/MMMM/yyyy', Locale('es', 'ES').toString())
          .format(dateRange.start);
    }
  }

  String getUntil() {
    if (dateRange == null) {
      return 'Until';
    } else {
      return DateFormat('dd/MMMM/yyyy', Locale('es', 'ES').toString())
          .format(dateRange.end);
    }
  }

  Future pickDateRange(BuildContext context) async {
    final initialDateRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now().add(Duration(hours: 24 * 3)),
    );
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDateRange: dateRange ?? initialDateRange,
    );

    if (newDateRange == null) return;

    setState(() => dateRange = newDateRange);
  }

  Widget filtros(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ButtonWidget(
            text: getFrom(),
            onClicked: () => pickDateRange(context),
          ),
        ),
        const SizedBox(width: 8),
        Icon(Icons.arrow_forward, color: Colors.white),
        const SizedBox(width: 8),
        Expanded(
          child: ButtonWidget(
            text: getUntil(),
            onClicked: () => pickDateRange(context),
          ),
        ),
      ],
    );
  }

  Widget buildListTile(IngresosEgresosModel item) {
    DateTime dateTime = DateFormat("yyyy-MM-dd hh:mm:ss").parse(item.fecha);
    String fecha = DateFormat('dd/MMMM/yyyy', "ES_MX").format(dateTime);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.concepto,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.tipo.toString() + item.monto.toString()),
              Text(
                fecha,
                textAlign: TextAlign.right,
              )
            ],
          )
        ],
      ),
      onTap: () {},
    );
  }

  void dismissSlidableItem(BuildContext context, int index,
      SlidableAction action, MovimientosInfo items, int id) {
    switch (action) {
      case SlidableAction.archive:
        Utils.showSnackBar(context, 'Chat has been archived');
        break;
      case SlidableAction.share:
        Utils.showSnackBar(context, 'Chat has been shared');
        break;
      case SlidableAction.more:
        Utils.showSnackBar(context, 'Selected more');
        break;
      case SlidableAction.delete:
        items.borrarMovimiento(id);
        Utils.showSnackBar(context, 'El registro ha sido eliminado');
        break;
    }
  }

  Widget _botonGuardar(MovimientosInfo movimientosInfo) {
    TextStyle style = TextStyle(fontSize: 35.0, color: Colors.white);
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.orange[50],
      primary: Colors.orange,
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(18.0),
        side: BorderSide(color: Color(0xff1a237e)),
      ),
    );
    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: () {
        movimientosInfo.obtenerMovimientos();
      },
      child: Text("Guardar", style: style),
    );
  }
}
