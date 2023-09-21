<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>About Us</title>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 50%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>
</head>
<body>

<div class="about-section">
  <h1>About Us</h1>
  <p style="text-align:justify;line-height:25px;">The <b>"BOOKACAN"</b> website is build to provide the stable business platform for the vendors. Using "BOOKACAN" website any one can buy the water can, bottle, tankers. This system is designed for the vendors to selling the water can, bottle., tankers. No formal knowledge is needed for the users to use this system. Thus this all it proves it is user friendly. It assists the vendors to grow there business</p>
  <p style="text-align:justify;line-height:25px;">BOOKACAN web site to provide the proper platform for the vendors and users. Using this website we provide the fresh and clean water to your doorsteps. Using this website we provide the proper platform for the local vendors sell the fresh water. It will also help the users to find the clean water to rent the tankers or water cans for any events.</p>
</div>

<h2 style="text-align:center">Our Team</h2>
<div class="row">
  <div class="column">
    <div class="card">
      <img src="images/team1.jpg" alt="Jane" style="width:100%">
      <div class="container">
        <h2>Harsh Nemade</h2>
        <p class="title">CEO & Founder</p>
        <p>Student of MCA(Roll No 87)</p>
        <p>team1@gmail.com</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card">
      <img src="images/team2.jpg" alt="Mike" style="width:100%">
      <div class="container">
        <h2>Vivek Lohakare</h2>
        <p class="title">Director</p>
        <p>Student of MCA(Roll No 136)</p>
        <p>team2@gmail.com</p>
      </div>
    </div>
  </div>  
</div>

</body>
</html>
