<?php
$baglan=mysqli_connect("localhost","root","","ariza_sunucu");
mysqli_query($baglan,"SET NAMES UTF8");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Genel</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="stylee.css" type="text/css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['İsimler', 'Oranlar'],
          <?php 
			$query = "SELECT Count(musteri.m_id) as musteri_sayisi,ilce.ilce_adi as ilce_adi from musteri,ilce where musteri.ilce_id=ilce.ilce_id group by ilce.ilce_adi";
          
			$exec = mysqli_query($baglan,$query);
			 while($row = mysqli_fetch_array($exec)){
 
			 echo "['".$row['ilce_adi']."',".$row['musteri_sayisi']."],";
			 }
			 ?> 
        ]);

        var options = {
          title: 'Tüm Müşteriler'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['İlçeler', 'Arıza Oranı'],
          <?php 
			$query = "SELECT (ariza_ortak.ariza_sayisi/mus_ortak.musteri_sayisi)AS ariza_orani,mus_ortak.ilce_adi
      FROM ariza_ortak
      INNER JOIN mus_ortak ON mus_ortak.ilce_adi=ariza_ortak.ilce_adi ORDER BY ariza_orani";
 
			 $exec = mysqli_query($baglan,$query);
			 while($row = mysqli_fetch_array($exec)){
 
			 echo "['".$row['ilce_adi']."',".$row['ariza_orani']."],";
			 }
			 ?> 
        ]);

        var options = {
          chart: {
            title: 'Arıza Oranları',
            subtitle: 'Genel',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
</head>
<body>
    <div class="anamenü" >
        <div class="navbar navbar-inverse navbar-fixed-top">   
        <div class="header">
              <h1 id="kafaa">Arıza Müdahale</h1>
              <h1 id="kafa">Karar Destek Sistemi</h1>
          </div> 
    </div>
    <div class="orta">
        <div class="dikeymenü">
            <ul>
               
                <li><a href="genel.php" id="arizalar">Genel</a></li>
                <li><a href="arizatur.php" id="arizakayit">Arıza Türüne Göre</a></li>
                <li><a href="aliaga.php" id="mahalle">Aliağa</a></li>
                <li><a href="buca.php" id="deneme">Buca</a></li>
                <li><a href="bornova.php" id="deneme1">Bornova</a></li>
                <li><a href="konak.php" id="deneme2">Konak</a></li>
                <li><a href="karsiyaka.php" id="deneme3">Karşıyaka</a></li>
            </ul>
    </div>
    <div id='grafik' style="margin-left:-70px;" >
        <div id="piechart" style="width: 600px; height: 300px; margin-left:300px; margin-top:-450px;"></div>
        <div id="columnchart_material" style="width: 500px; height: 300px; margin-left:800px; margin-top:-300px;"></div>
      </div>
        <div style="margin-left:300px; margin-top;200px;" >
        <h4><font face="tahoma" color="red">Arıza Kaynağı Tahminleri</font></h4>
        <h5>Arıza Oranı %25 ten düşük ise:</h5>
        <p>Bilgisayar Kaynaklı Yazılımsal,Donanımsal Problemler<br>Modem Problemleri</p>
        <h5>Arıza Oranı %50 ile %100 arasında ise:</h5>
        <p>Servis Sağlayıcı Firma Alt Yapı Problemleri</p>
        <div style="margin-left:500px; margin-top:-180px;">
        <h5>Arıza Oranı %25 ile %50 arasında ise:</h5>
        <p>Bina Ankastresi(Bina içi Kablo ve Bağlantı Noktaları)<br>Arıza Devamı Durumunda:Servis Sağlayıcı Firma Alt Yapı Problemleri</p>
        </div>
    </div>
    </div>
</body>
</html>