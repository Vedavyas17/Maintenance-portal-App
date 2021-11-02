class WorkOrderListDisplay
{
  final orderid;
  final order_type;
  final plant;
  final comp_code;
  final funct_loc;
  final processing_group;
  final object_class;
  final start_date;
  final finish_date;
  final production_start_date;
  final production_finish_date;
  final production_start_time;
  final production_finish_time;
  final currency;
  final network_profile;
  final entered_by;
  final enter_date;
  final scenario;
  final sys_status;
  final routing_no;
  final reser_no;
  final short_text;
  final priotype;
  WorkOrderListDisplay({this.orderid,this.sys_status,this.scenario,this.enter_date,this.entered_by,
  this.network_profile,this.currency,this.production_start_time,this.processing_group,this.production_finish_date,
  this.production_finish_time,this.production_start_date,this.finish_date,this.start_date,this.object_class,this.plant,this.comp_code,this.order_type,
  this.funct_loc,this.routing_no,this.reser_no,this.short_text,this.priotype});
}