import 'package:app/admin/Admin/dashwidget.dart';
import 'package:app/admin/Admin/profit.dart';
import 'package:app/admin/api/api_service.dart';

import 'package:app/user/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

 
  @override
  Widget build(BuildContext context, WidgetRef ref) {
     final dashboard = ref.watch(dashboardProvider);


 return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                      
                      radius: 60.0,
                      
                      backgroundColor: Colors.yellow,
                      backgroundImage: AssetImage("pics/daisy.jpeg"),
                    ),
          ),
          title:const  Center(child: Text("Admin name", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
         
        ),
        body: Column(
        
          children: [
  
            const SizedBox(height: 10),
            const Text("Dashboard",
                style: TextStyle(fontSize: 20,)),
            const SizedBox(height: 10),
            dashboard.when(
              data: (data) => 
               GridView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2 / 1.7,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 5,
                ),
                children: [
                    dashy(Icons.business, "Today Visit", data.todayVisit.count.toString()),
                    dashy(Icons.money_outlined, "Total Sales", data.totalSales.toString()),
                    dashy(Icons.menu_book, "Total Products", data.totalProducts.toString()),
                    dashy(Icons.people, "Total Users", data.totalUsers.toString()),
                    dashy(Icons.message_rounded, "New Orders", data.newOrders.count.toString()),
                    dashy(Icons.people_alt_outlined, "New Users", data.newUsers.count.toString()),
                ],
               
               
              ),
               error: (Object error, StackTrace stackTrace) {
                    return Text(error.toString());
                  },
              loading: () => const CircularProgressIndicator(),
            ),
            const SizedBox(height: 10),
            const Text("Revenue",
                style: TextStyle(fontSize: 20,)),
            const SizedBox(height: 10),
         SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          series: <ChartSeries>[
            SplineAreaSeries<SalesData, String>(
              dataSource: <SalesData>[
                SalesData('Jan', 35),
                SalesData('Feb', 28),
                SalesData('Mar', 34),
                SalesData('Apr', 32),
                SalesData('May', 23),
                SalesData('June', 34),
                SalesData('July', 45),
                SalesData('Aug', 35),
                SalesData('Sep', 30),
                SalesData('Oct', 25),
                SalesData('Nov', 30),
                SalesData('Dec', 45),
               
              ],
              xValueMapper: (SalesData sales, _) => sales.month,
              yValueMapper: (SalesData sales, _) => sales.sales,
            ),
          ],
        ),
          Row(
            children: [
              const SizedBox( width: 30,),
              ElevatedButton(
                onPressed: () => Get.to( const ProfitPage()),
                child: const Text("Stats",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
             const SizedBox( width: 50,),
             
          
                 ElevatedButton(
                onPressed: () => Get.to( const LoginPage()),
                child: const Text("Log",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),

            ],
          ),
        
          ],
        ),
      ),
    );
  }
}
class SalesData {
  SalesData(this.month, this.sales);

  final String month;
  final double sales;
}
    