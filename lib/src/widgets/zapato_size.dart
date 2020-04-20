import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoesapp/src/models/zapato_model.dart';
import 'package:shoesapp/src/pages/zapato_desc_page.dart';

class ZapatonSizePreview extends StatelessWidget {
  final bool fullScreen;

  ZapatonSizePreview({this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => ZapatoDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: fullScreen ? 5.0 : 30.0,
            vertical: fullScreen ? 5.0 : 5.0),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 410.0 : 430.0,
          decoration: BoxDecoration(
              color: Color(0xffFFCF53),
              borderRadius: !fullScreen
                  ? BorderRadius.circular(50.0)
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
          child: Column(
            children: <Widget>[
              _ZapatoConSombra(),
              if (!fullScreen) _ZapatoTallas()
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final double numero;

  _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return GestureDetector(
      onTap: () {
        zapatoModel.talla = numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${numero.toString().replaceAll('.0', '')}',
            style: TextStyle(
                color: (numero == zapatoModel.talla)
                    ? Colors.white
                    : Color(0xffF1A23A),
                fontSize: 16.0,
                fontWeight: FontWeight.bold)),
        width: 45.0,
        height: 45.0,
        decoration: BoxDecoration(
            color: (numero == zapatoModel.talla)
                ? Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              if (numero == zapatoModel.talla)
                BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10.0,
                    offset: Offset(0, 5))
            ]),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Stack(
        children: <Widget>[
          Positioned(bottom: 20.0, right: 0.0, child: _ZapatoSombra()),
          Image(image: AssetImage(zapatoModel.assetImage))
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230.0,
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: [BoxShadow(color: Color(0xffEAA14E), blurRadius: 40.0)]),
      ),
    );
  }
}
