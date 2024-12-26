<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="jakarta.servlet.http.HttpSession"%>




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700;800;900&family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />

    <!-- Icon -->
    <link
      rel="stylesheet"
      href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"
    />
    <!-- icon -->

    <!-- Google fonts End -->

    <!-- custon style Sheet & JavaScript -->
    <link rel="stylesheet" href="css/shop.css" />
    <link rel="stylesheet" href="css/index.css" />
    <link rel="stylesheet" href="css/about.css" />
    <link rel="stylesheet" href="css/blog.css" />
    <script src="js/index.js" defer></script>
    <script src="js/shop.js" defer></script>
    <!-- custon style Sheet & JavaScript -->
    <title>The Arcade Store</title>
    <!-- Adds icon to title -->
    <link rel="icon" href="image\title.png" type="image/x-icon" />
  </head>

  <body class="home">

    <!-- ========================== Header Section ============================== -->
    
  

    <header class="primary-header container flex">
      <div class="header-inner-one flex">
          <div class="logo">
              <a href="index.jsp"><img src="image\logo.png.png" alt=""></a>
          </div>
          <button class="mobile-close-btn" data-visible="false" aria-controls="primary-navigation"><i class="uil uil-times-circle"></i></button>


          <nav>
              <ul id="primary-navigation" data-visible="false" class="primary-navigation flex">
                  <li><a class="fs-100 fs-montserrat bold-500" href="index.jsp">Home</a></li>
                  <li><a class="fs-100 fs-montserrat bold-500" href="shop.jsp">Shop</a></li>
                  <li><a class="fs-100 fs-montserrat bold-500" href="about.jsp">About</a></li>
                  <li><a class="active  fs-100 fs-montserrat bold-500" href="blog.jsp">Blog</a></li>
                  <li><a class="fs-100 fs-montserrat bold-500" href="contactus.jsp">Contact Us</a></li>
              </ul>
          </nav>
      </diV>


      <div class="header-login flex">
          
          <!-- ================================ Search ======================================== -->
          <div class="home-search text-black flex">
              
              <input type="text" placeholder="      search" class="srput fs-montserrat ">
                <div class="ok">
                    <!-- <i class="uil text-black uil-search"></i> -->
                </div>
          </div>

<!-- ================================ login ======================================== -->
<!-- <a href="login.jsp"><button class="navbut bg-red text-white fs-100 fs-montserrat bold-500" style="text-decoration: none;" >login</button></a> -->

 	<%
		HttpSession s = request.getSession();
		String pname = (String)s.getAttribute("pname");
		String uid = (String)s.getAttribute("uid");
			
			%>
			

          <!-- ================================ user icon ======================================== -->

            <i id="user-box" aria-controls="user-icon" class="uil uil-user-circle" onclick="togmenu()"></i>
            <div class="sub-menu-wrap" id="submenu">
                <div class="sub-menu">
                    <div class="user-info">
                        <img style="height: 60px; width: 60px; overflow: hidden; object-fit: cover;" src="Cimg_search?uid=<%=uid %>">
                        
                        <h2><%=pname%></h2>
                        	
                    </div>
                    <hr>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="#" class="sub-menu-link">
    <img src="image/profile.png">
    <p>Edit Profile</p>
    <span>></span>
</a>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="#" class="sub-menu-link">
    <img src="image/setting.png">
    <p>Settings & Privacy</p>
    <span>></span>
</a>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="contactus.jsp" class="sub-menu-link">
    <img src="image/help.png">
    <p>Help & Support</p>
    <span>></span>
</a>
<!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="Logout" class="sub-menu-link">
    <img src="image/logout.png">
    <p>Log Out</p>
    <span>></span>
</a>

              </div>
          </div>
          
     <!-- ================================ cart icon ======================================== -->
            <div style="position: relative; display: inline-block; margin-bottom: 12px;">
   
        <i id="cart-box" aria-controls="cart-icon" class="uil uil-shopping-bag" onclick="togcart()" style="text-decoration: none;"></i>
        
   
</div>


            <!-- ============= Cart Box ============ -->
            
            

            <div id="cart-icon" data-visible="false" class="cart-icon">
              
        </div>

        <div class="mobile-open-btn">
            <i class="uil uil-align-right"></i>
        </div>

  <div class="sub-cart-wrap" id="subcart">
          <div class="sub-cart">
              <div class="cart-info">
                  <h3>Shopping Cart</h3>                  
              </div>
              <hr>
              
              
   <%		
		

		try 
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String databaseurl = "jdbc:mysql://localhost:3306/user";
			String un = "root";
			String pwd = "Binit.1234";
					
			Connection con = DriverManager.getConnection(databaseurl,un,pwd);
			String sql = "select * from cart where uid=?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, uid);
			
			ResultSet rs = ps.executeQuery();
			
			
			 int counter = 0;		        	

			
			while(rs.next() && counter < 2)
			{
				
				counter++;
   %>
 <!--  ---------------------------------------- --------------------------------- ------------------  -->
<a href="#" class="sub-pro">
    <img src="File_search?pid=<%=rs.getString("pid") %>" >
    <p class="fs-200"><%=rs.getString("pdname") %></p>
    <span id="qt"><b>Qty : </b><%=rs.getString("quantity") %></span>
    <span id='pr'>&#8377;<%=rs.getString("pdprice") %></span>
</a>
<hr>
			<%
			
			}			
		}
		catch(Exception e)
		{
			
		}
	%>

           <a href="cart.jsp" style="text-decoration: none; color: black;  margin-left:41%;">   <button class="navbut bg-red text-white fs-100 fs-montserrat bold-500" style="text-decoration: none; transform:scale(0.7); " >Cart</button> </a>
          </div>
      </div>

        
       </div>


  </header>

  <!-- ======================== End header section ================================ -->


<!-- ================================= Feature section =================================== -->
    
<section class="shop-feature bg-grey grid">
  <div>
  <p class="fs-montserrat text-black">Home <span aria-haspopup="true" class="margin">></span>blog</p>
  </div>
  <h2 class="fs-poppins fs-300 bold-800">Blogs</h2>
</section>
<!-- ================================= End feature section =================================== -->


<!-- ========================= Blog Section ========================== -->


<!-- ============================ Heading Recent News =============================== -->


<!-- ==================================== 1st Row =================================================== -->

<section class="recent-news blog grid">
    <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
    <div class="news grid">
    <img src="image/news-1.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">How to choose perfect gadgets
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> when , while the lovely valley teems with vapour around me , aand the meridian sun strikes the upper.
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <div class="news grid">
    <img src="image/news-2.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">Smartwatches are becoming smarter
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> Smartwatches are meant for more convinence and usability and the features it provides are increasing.
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <div class="news grid">
    <img src="image/news-3.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">How to choose perfect gadgets
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> when , while the lovely valley teems with vapour around me , aand the meridian sun strikes the upper.
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</section>

<!-- ==================================== 2nd Row =================================================== -->


<section class="recent-news blog grid">
    <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
    <div class="news grid">
    <img src="image/news-4.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">Smartwatches bringing Innovative sollutions
    </h2>
    <p class="fs-montserrat padding-inline fs-100">Smartwatches Bringing Solutions to Enhance Daily Life, Revolutionizing Health Monitoring, Connectivity, and Personal Productivity.
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <div class="news grid">
    <img src="image/news-5.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">DSLR Cameras: Capturing Excellence
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> Changes , adaptions , settings , attachments that can be done to capture  better photos with your DSLR .
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <div class="news grid">
    <img src="image/news-6.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">Meta Quest Pro: Redefining Virtual Reality
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> The new Meta Quest Pro sets a new benchmark in immersive technology..
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</section>

<!-- ==================================== 3rd Row =================================================== -->


<section class="recent-news grid">
    <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
    <div class="news grid">
    <img src="image/news-7.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">Iphones arent any less than a Rig
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> Modern Phones specially a new iphone along with some special attachments are really good camera rig.
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <div class="news grid">
    <img src="image/news-8.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">Drones Revolutionize Aerial Technology
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> Drones Revolutionize Aerial Technology with Innovations in Efficiency and Versatility.
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <div class="news grid">
    <img src="image/news-9.png" alt="">
  <div class="fs-montserrat fs-100 flex">
    <p>Ocutober 5, 2022</p>
    <p>by ecommercestore3</p>
  </div>
    <h2 class="fs-poppins padding-inline fs-200 bold-500">Apple’s iPhone 16 launch shows AI
    </h2>
    <p class="fs-montserrat padding-inline fs-100"> At a launch event on Monday September 9, Apple released details of its new iPhone 16.
    </p>
  </div>
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</section>

<!-- ==================================== 4th Row =================================================== -->


<section class="recent-news grid">
  <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
  <div class="news grid">
  <img src="image/news-10.png" alt="">
<div class="fs-montserrat fs-100 flex">
  <p>Ocutober 5, 2022</p>
  <p>by ecommercestore3</p>
</div>
  <h2 class="fs-poppins padding-inline fs-200 bold-500">How to choose perfect gadgets
  </h2>
  <p class="fs-montserrat padding-inline fs-100"> when , while the lovely valley teems with vapour around me , aand the meridian sun strikes the upper.
  </p>
</div>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

 <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 <div class="news grid">
  <img src="image/news-11.png" alt="">
<div class="fs-montserrat fs-100 flex">
  <p>Ocutober 5, 2022</p>
  <p>by ecommercestore3</p>
</div>
  <h2 class="fs-poppins padding-inline fs-200 bold-500">The Vision Pro is the future
  </h2>
  <p class="fs-montserrat padding-inline fs-100">Vision pro the latest tech launch from apple's side is straight from the future.
  </p>
</div>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->

 <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
 <div class="news grid">
  <img src="image/news-12.png" alt="">
<div class="fs-montserrat fs-100 flex">
  <p>Ocutober 5, 2022</p>
  <p>by ecommercestore3</p>
</div>
  <h2 class="fs-poppins padding-inline fs-200 bold-500">How to choose perfect gadgets
  </h2>
  <p class="fs-montserrat padding-inline fs-100"> when , while the lovely valley teems with vapour around me , aand the meridian sun strikes the upper.
  </p>
</div>
<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
</section>


<!-- ============================ End of Heading Recent News =============================== -->


<!-- ========================= End of Blog Section ========================== -->


    <!-- ========================= Brand Section ========================== -->

<section class="brands grid">
  <div>
      <img src="image/br-1.png">
  </div>
  <div>
      <img src="image/br-2.png">
  </div>
  <div>
      <img src="image/br-3.png">
  </div>
  <div>
      <img src="image/br-4.png">
  </div>
  <div>
      <img src="image/br-5.png">
  </div>
  <div>
      <img src="image/br-6.png">
  </div>
</section>

<!-- ========================= End of Brand Section ========================== -->


<!-- ========================= footer Section ========================== -->

<section class="footer grid">
  <div class="footer-logo grid">
    <a href="index.jsp"><img src="image\logo.png.png" alt="" id="log"></a>
            <p class="fs-montserrat fs-100"> Connect with us</p>
                <div class="social-media flex">
                    <i class="uil uil-facebook-f"></i>
                    <i class="uil uil-instagram"></i>
                    <i class="uil uil-twitter"></i>
                    <i class="uil uil-linkedin"></i>
                    <i class="uil uil-telegram"></i>
                    <i class="uil uil-github"></i>
                </div>
    </div>
        <div class="footer-menu grid">
             <h3> Quick Links </h3>
             <ul>
                <li><a class="fs-montserrat text-black fs-100" href="index.jsp">Home</a></li>
                <li><a class="fs-montserrat text-black fs-100" href="shop.jsp">Shop</a></li>
                <li><a class="fs-montserrat text-black fs-100" href="about.jsp">About</a></li>
                <li><a class="fs-montserrat text-black fs-100" href="blog.jsp">Blogs</a></li>
                <li><a class="fs-montserrat text-black fs-100" href="contactus.jsp">Contact</a></li>
             </ul>
        </div> 
        <div class="contact grid">
            <h3 class="fs-poppins fs-200 bold-800">Contact</h3>
            <p class="fs-montserrat">+99 (0) 101 0000 888 ______________________ 40 , cross road , jhilbagan , dumdum , kolkata - 7000030 , west bengal , india</p>
        </div>
        <div class="emails grid">
        <h3 class="fs-poppins fs-200 bold-800"> Subscribe and connect </h3>
        <p class="updates fs-poppins fs-300 bold-800"> For latest News & updates </p>
        
        <div class="inputfield flex bg-gray"> 
        <input type="email" placeholder="Enter Your Email" class="fs-montserrat bg-gray">
            <button class="bg-red text-white fs-poppins fs-50"> Subscribe </button>
        </div>
        </div>
</section>
<!-- ========================= End of footer Section ========================== -->

<!-- ========================= Copyright Section ========================== -->

<section class="copyright">
    <!-- <p class="c-font fs-montserrat fs-100">2024 Store. All rights reserved </p> -->
    <p class="fs-montserrat fs-100 text-align p-top">&#169 Privacy Policy reserved to The Arcade Team 2024. Terms & Conditions applied. </p>
    </section>
<!-- ========================= End of Copyright Section ========================== -->
</body>
</html>
