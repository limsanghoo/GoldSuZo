<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<title>Loading Effects for Grid Items | Demo 2</title>
		<meta name="description" content="Loading Effects for Grid Items with CSS Animations" />
		<meta name="keywords" content="css animation, loading effect, google plus, grid items, masonry" />
		<meta name="author" content="Codrops" />
		<link rel="shortcut icon" href="../favicon.ico"> 
		<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/default.css" />
		<link rel="stylesheet" type="text/css" href="/common/css/GridLoadingEffects/css/component.css"/>
		<script src="/common/css/GridLoadingEffects/js/modernizr.custom.js"></script>
		
		
		
		
		<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-7243260-2']);
		_gaq.push(['_trackPageview']);
		(function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();
		</script>
	</head>
	<body>
		<div class="container">
			<!-- Top Navigation -->
			<div class="codrops-top clearfix">
				<a class="codrops-icon codrops-icon-prev" href="http://tympanus.net/Tutorials/ExpandingSearchBar/"><span>Previous Demo</span></a>
				<span class="right"><a href="http://dribbble.com/erikamackley">Illustrations by by Erika Mackley</a><a class="codrops-icon codrops-icon-drop" href="http://tympanus.net/codrops/?p=15677"><span>Back to the Codrops Article</span></a></span>
			</div>
			<header>
				<h1>Loading Effects for Grid Items <span>with CSS Animations</span></h1>	
				<nav class="codrops-demos">
					<a href="index.html">Demo 1</a>
					<a class="current-demo" href="index2.html">Demo 2</a>
					<a href="index3.html">Demo 3</a>
					<a href="index4.html">Demo 4</a>
					<a href="index5.html">Demo 5</a>
					<a href="index6.html">Demo 6</a>
					<a href="index7.html">Demo 7</a>
					<a href="index8.html">Demo 8</a>
				</nav>
			</header>
			<ul class="grid effect-2" id="grid">
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X500"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X600"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X100"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X300"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X200"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X400"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X500"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X200"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X300"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X100"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X200"></a></li>
				<li><a href="http://drbl.in/fWMM"><img src="http://placehold.it/500X900"></a></li>
			</ul>
		</div>
		<script src="/common/css/GridLoadingEffects/js/masonry.pkgd.min.js"></script>
		<script src="/common/css/GridLoadingEffects/js/imagesloaded.js"></script>
		<script src="/common/css/GridLoadingEffects/js/classie.js"></script>
		<script src="/common/css/GridLoadingEffects/js/AnimOnScroll.js"></script>
		<script>
			new AnimOnScroll( document.getElementById( 'grid' ), {
				minDuration : 0.4,
				maxDuration : 0.7,
				viewportFactor : 0.2
			} );
		</script>
		<!-- For the demo ad -->   
		<script src="//tympanus.net/codrops/adpacks/demoad.js"></script>
	</body>
</html>