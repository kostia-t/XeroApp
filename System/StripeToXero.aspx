<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StripeToXero.aspx.cs" Inherits="System_StripeToXero" %>

<!DOCTYPE html>
<html>
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>StriXer - Accounting System v1.0</title>

<link rel="stylesheet" href="css/style.default.css" type="text/css" />
<link rel="stylesheet" href="css/isotope.css" type="text/css" />
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.1.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.10.3.min.js"></script>
<script type="text/javascript" src="js/modernizr.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.isotope.min.js"></script>
<script type="text/javascript" src="js/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script type="text/javascript" src="js/jquery.slimscroll.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
<script type="text/javascript">
    
    var reporter = <%=reporter%>;
    if(reporter == 1)
    {
        alert("Stripe data imported succesfully");
    }
    
    function jsAnalyseData()
    {
        alert("Stripe data will be submitted now to Xero");
        location.href=window.location.href;
    }

    if(reporter==1){ alert("Import from details successfully completed!, Check your Xero account to reconcile.");}
    jQuery(document).ready(function(){
        
      
        jQuery('a[data-rel]').each(function() {
            jQuery(this).attr('rel', jQuery(this).data('rel'));
        });
        
        jQuery("#medialist a").colorbox();
        
    });
    jQuery(window).load(function(){
        jQuery('#medialist').isotope({
            itemSelector : 'li',
            layoutMode : 'fitRows'
        });
        
        // Media Filter
        jQuery('#mediafilter a').click(function(){
	    
            var filter = (jQuery(this).attr('href') != 'all')? '.'+jQuery(this).attr('href') : '*';
            jQuery('#medialist').isotope({ filter: filter });
	    
            jQuery('#mediafilter li').removeClass('current');
            jQuery(this).parent().addClass('current');
	    
            return false;
        });
    });
</script>
</head>

<body>

<div id="mainwrapper" class="mainwrapper">
    
    <div class="header">
        <div class="logo">
            <a href="Default.aspx"><img src="images/logo.png" alt="" /></a>
        </div>
        <div class="headerinner">
            <ul class="headmenu">
                <li class="odd">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="count">4</span>
                        <span class="head-icon head-message"></span>
                        <span class="headmenu-label">Messages</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-header">Messages</li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Jack</strong> <small class="muted"> - 19 hours ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Daniel</strong> <small class="muted"> - 2 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Jane</strong> <small class="muted"> - 3 days ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Tanya</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li><a href=""><span class="icon-envelope"></span> New message from <strong>Lee</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li class="viewmore"><a href="#">View More Messages</a></li>
                    </ul>
                </li>
                <li>
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <span class="count">10</span>
                    <span class="head-icon head-users"></span>
                    <span class="headmenu-label">New Users</span>
                    </a>
                    <ul class="dropdown-menu newusers">
                        <li class="nav-header">New Users</li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb1.png" alt="" class="userthumb" />
                                <strong>Draniem Daamul</strong>
                                <small>April 20, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb2.png" alt="" class="userthumb" />
                                <strong>Shamcey Sindilmaca</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb3.png" alt="" class="userthumb" />
                                <strong>Nusja Paul Nawancali</strong>
                                <small>April 19, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb4.png" alt="" class="userthumb" />
                                <strong>Rose Cerona</strong>
                                <small>April 18, 2013</small>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <img src="images/photos/thumb5.png" alt="" class="userthumb" />
                                <strong>John Doe</strong>
                                <small>April 16, 2013</small>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="odd">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#">
                    <span class="count">1</span>
                    <span class="head-icon head-bar"></span>
                    <span class="headmenu-label">Statistics</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="nav-header">Statistics</li>
                        <li><a href=""><span class="icon-align-left"></span> New Reports from <strong>Products</strong> <small class="muted"> - 19 hours ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> New Statistics from <strong>Users</strong> <small class="muted"> - 2 days ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> New Statistics from <strong>Comments</strong> <small class="muted"> - 3 days ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> Most Popular in <strong>Products</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li><a href=""><span class="icon-align-left"></span> Most Viewed in <strong>Blog</strong> <small class="muted"> - 1 week ago</small></a></li>
                        <li class="viewmore"><a href="#">View More Statistics</a></li>
                    </ul>
                </li>
                <li class="right">
                    <div class="userloggedinfo">
                        <img src="images/photos/thumb1.png" alt="" />
                        <div class="userinfo">
                            <h5>Guido Silbert <small>- guido@gmail.com</small></h5>
                            <ul>
                                <li><a href="#">Edit Profile</a></li>
                                <li><a href="#">Account Settings</a></li>
                                <li><a href="http://medialeven.com">Sign Out</a></li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul><!--headmenu-->
        </div>
    </div>
    
     <div class="leftpanel">
        <div class="leftmenu">        
            <ul class="nav nav-tabs nav-stacked">
            	<li class="nav-header">Navigation</li>
                <li class="active"><a href="Default.aspx"><span class="iconfa-laptop"></span> Dashboard</a></li>
                <li><a href="XeroOuth/Default.aspx"><span class="iconfa-hand-up"></span> Stripe to Xero</a></li>
                 <li><a href="ExportCSV.aspx"><span class="iconfa-book"></span>Export Store Data</a>
                 <li><a href="calendar.html"><span class="iconfa-calendar"></span> Calendar</a></li>
                  <li><a href=""><span class="iconfa-book"></span> Logout</a>
              
            </ul>
        </div><!--leftmenu-->
        
    </div><!-- leftpanel -->
    
    <div class="rightpanel">
        
        <ul class="breadcrumbs">
            <li><a href="Default.aspx"><i class="iconfa-home"></i></a> <span class="separator"></span></li>
            <li>Stripe to Xero</li>
            
            <li class="right">
                <a href="" data-toggle="dropdown" class="dropdown-toggle"><i class="icon-tint"></i> Color Skins</a>
                <ul class="dropdown-menu pull-right skin-color">
                    <li><a href="default">Default</a></li>
                    <li><a href="navyblue">Navy Blue</a></li>
                    <li><a href="palegreen">Pale Green</a></li>
                    <li><a href="red">Red</a></li>
                    <li><a href="green">Green</a></li>
                    <li><a href="brown">Brown</a></li>
                </ul>
            </li>
        </ul>
        
        <div class="pageheader">
           <!-- <form action="#" method="post" class="searchbar">-->
                <input type="text" name="keyword" placeholder="To search type and hit enter..." />
            <!--</form>-->
            <div class="pageicon"><span class="iconfa-laptop"></span></div>
            <div class="pagetitle">
                <h5>Manage Files Exported from Online Store(s)</h5>
                <h1>Online Store CSV File Manager</h1>
            </div>
        </div><!--pageheader-->
        
        <div class="maincontent">
            <div class="maincontentinner">
                <div class="mediamgr">
            	<div class="mediamgr_left">
                	<div class="mediamgr_head">
                    	<ul class="mediamgr_menu">
                        	<li><a class="btn prev prev_disabled"><span class="icon-chevron-left"></span></a></li>
                            <li><a class="btn next"><span class="icon-chevron-right"></span></a></li>
                            <li class="marginleft15"><a class="btn selectall"><span class="icon-check"></span> Select All</a></li>
                            <li class="marginleft15 newfoldbtn"><a class="btn newfolder" title="Add New Folder"><span class="icon-folder-open"></span></a></li>
                            <li class="marginleft5 trashbtn"><a class="btn trash" title="Trash"><span class="icon-trash"></span></a></li>
                            <li class="marginleft15 filesearch">
                            	<form id="form2" runat="server">
                            		   <input id="FileSource1" name="FileSource1" type="file"  class="btn btn-default" runat="server" style="width:30em;"/>
                                </form>
                            </li>
                            <li class="right newfilebtn"><button type="button" class="btn btn-primary" runat="server" onserverclick="AnalyseData_Click">Execute</button></li>
                           
                        </ul>
                        <span class="clearall"></span>
                    </div><!--mediamgr_head-->
                    
                    <div class="mediamgr_category">
                    <ul id="mediafilter">
                        	<li><a href="all">All</a></li>
                            <li><a href="image">Images</a></li>
                            <li><a href="video">Video</a></li>
                            <li><a href="audio">Audio</a></li>
                            <li class="current"><a href="doc">Documents</a></li>
                            <li class="right"><span class="pagenuminfo">Showing 1 - 20 of 69</span></li>
                        </ul>
                    </div><!--mediamgr_category-->
                    
                    <div class="mediamgr_content">
						<ul id="medialist" class="listfile">
                        	 <li class="doc">
                                <a href="#"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">11082017order_csv.csv</span>
                            </li>
                            <li class="doc">
                                <a href="#"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">12082017order_csv.csv</span>
                            </li>
                            <li class="doc">
                                <a href="#"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">12152017order_csv.csv</span>
                            </li>
                        	 <li class="doc">
                                <a href="#"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">12152017order_csv.csv</span>
                            </li>
                           <li class="doc">
                                <a href="#"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">12152017order_csv.csv</span>
                            </li>
                            <li class="doc">
                                <a href="#"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">12152017order_csv.csv</span>
                            </li>
                            <li class="doc">
                                <a href="#"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">12152017order_csv.csv</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial2.pdf</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial3.pdf</span>
                            </li>
                            <li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image3.png" alt="" /></a>
                            	<span class="filename">Image1.jpg</span>
                            </li>
                        	<li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image4.png" alt="" /></a>
                            	<span class="filename">Image2.jpg</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html" data-rel="doc"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutoria4.pdf</span>
                            </li>
                            <li class="video">
                                <a href="ajax/video.html"><img src="images/thumbs/video.png" alt="" /></a>
                            	<span class="filename">Movie1.avi</span>
                            </li>
                            <li class="audio">
                                <a href="ajax/audio.html"><img src="images/thumbs/audio.png" alt="" /></a>
                            	<span class="filename">Song1.mp3</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial5.pdf</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial6.pdf</span>
                            </li>
                            <li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image5.png" alt="" /></a>
                            	<span class="filename">Image1.jpg</span>
                            </li>
                        	<li class="image">
                                <a href="ajax/image.html"><img src="images/thumbs/image6.png" alt="" /></a>
                            	<span class="filename">Image2.jpg</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial.pdf</span>
                            </li>
                            <li class="video">
                                <a href="ajax/video.html"><img src="images/thumbs/video.png" alt="" /></a>
                            	<span class="filename">Movie1.avi</span>
                            </li>
                            <li class="audio">
                                <a href="ajax/audio.html"><img src="images/thumbs/audio.png" alt="" /></a>
                            	<span class="filename">Song1.mp3</span>
                            </li>
                            <li class="doc">
                                <a href="ajax/doc.html"><img src="images/thumbs/doc.png" alt="" /></a>
                            	<span class="filename">Tutorial1.pdf</span>
                            </li>
                        </ul>
                        
                        <br class="clearall" />
                        
                    </div><!--mediamgr_content-->
                    
                </div><!--mediamgr_left -->
                
                <div class="mediamgr_right">
                	<div class="mediamgr_rightinner">
                        <h4>Browse Files</h4>
                        <ul class="menuright">
                        	<li class="current"><a href="">All Files</a></li>
                            <li><a href="">Deleted Files</a></li>
                            <li><a href="">Recently Added</a></li>
                            <li><a href="">Recently Viewed</a></li>
                            <li><a href="">New Folder</a></li>
                            <li><a href="">New Folder(2)</a></li>
                        </ul>
                    </div><!-- mediamgr_rightinner -->
                </div><!-- mediamgr_right -->
                <br class="clearall" />
            </div><!--mediamgr-->
            
            <div class="footer">
                    <div class="footer-left">
                        <span>&copy; 2017. StriXer Accounting App. All Rights Reserved.</span>
                    </div>
                    <div class="footer-right">
                        <span>Designed by: <a href="http://medialeven.com/">Stixer Dev</a></span>
                    </div>
                </div><!--footer-->
                
            </div><!--maincontentinner-->
        </div><!--maincontent-->
        
    </div><!--rightpanel-->
    
</div><!--mainwrapper-->

</body>
</html>
