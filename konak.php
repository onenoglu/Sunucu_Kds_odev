<?php
$baglan=mysqli_connect("localhost","root","","ariza_sunucu");
mysqli_query($baglan,"SET NAMES UTF8");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Konak</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="stylee.css" type="text/css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Arıza Türleri', 'Arıza Sayıları'],
          <?php 
			$query = "SELECT COUNT(ariza.a_id) AS ariza_sayisi,ariza_tur.t_ad
      FROM ariza,musteri,ilce,ariza_tur
      WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ariza.t_id=ariza_tur.t_id AND ilce.ilce_adi='Konak' 
      GROUP BY ariza_tur.t_id";
          
			$exec = mysqli_query($baglan,$query);
			 while($row = mysqli_fetch_array($exec)){
 
			 echo "['".$row['t_ad']."',".$row['ariza_sayisi']."],";
			 }
			 ?> 
        ]);

        var options = {
          title: 'Konak Arıza Nedenleri'
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
          ['İlçe Adı', 'Arıza Sayısı', 'Müşteri Sayısı'],
          <?php 
			$query = "SELECT COUNT(ariza.a_id) AS ariza_sayisi,ilce.ilce_adi,(SELECT COUNT(musteri.m_id) FROM musteri,ilce WHERE musteri.ilce_id=ilce.ilce_id AND ilce.ilce_adi='Konak' GROUP BY ilce.ilce_id) AS musteri_sayisi
      FROM ariza,musteri,ilce
      WHERE ariza.m_id=musteri.m_id AND ilce.ilce_id=musteri.ilce_id AND ilce.ilce_adi='Konak'
      GROUP BY ilce.ilce_adi order by ariza_sayisi";
          
			$exec = mysqli_query($baglan,$query);
			 while($row = mysqli_fetch_array($exec)){
 
       echo "['".$row['ilce_adi']."','".$row['ariza_sayisi']."','".$row['musteri_sayisi']."'],";
			 }
			 ?> 
        ]);

        var options = {
          chart: {
            title: 'Müşter-Arıza Sayısı Karşılaştırma',
            subtitle: 'Konak',
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
    <div id='grafik'>
        <div id="piechart" style="width: 500px; height: 300px; margin-left:300px; margin-top:-450px;"></div>
        <div id="columnchart_material" style="width: 500px; height: 300px; margin-left:800px; margin-top:-300px;"></div>
    </div>
    </div>
    </div>
</body>
</html>