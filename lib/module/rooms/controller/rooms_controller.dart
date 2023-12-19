
import 'package:flutter/material.dart';
import 'package:beellii/core.dart';
import '../view/rooms_view.dart';

class RoomsController extends State<RoomsView> {
    static late RoomsController instance;
    late RoomsView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    