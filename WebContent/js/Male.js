/**
 * Author: Giftson David Paul 
 * 
 */
        var container;
        var camera, scene, renderer;
        var width = 450; //450
        var height = 570; //570
        var material; 
        var skinMesh;   
        
        init(); 
        animate();
        
      function init() {        
            	container = document.getElementById('obj');            	
                scene = new THREE.Scene();                
                camera = new THREE.PerspectiveCamera( 18, width / height, 1, 8000 );              
                camera.position.z = 500;               
                scene.add( camera );   
        
                var ambient = new THREE.AmbientLight(0x111111 );
                scene.add( ambient );

                var directionalLight = new THREE.DirectionalLight( 0xffffff, 0.75 );
                directionalLight.position.set( 0, 0, 1 );
                scene.add( directionalLight ); 

               var pointLight = new THREE.PointLight( 0xffffff, 5, 29 );
      		   pointLight.position.set( 0, -25, 10 ); 
      		   scene.add( pointLight );  

                var loader = new THREE.OBJLoader();
        
                	  loader.load( "js/MaleDressed.obj", function ( object ) {
                          object.children[0].geometry.computeFaceNormals();
                          var  geometry = object.children[0].geometry;        				
                          THREE.GeometryUtils.center(geometry);
                          geometry.dynamic = true;                       		
                          material = new THREE.MeshBasicMaterial( { map: THREE.ImageUtils.loadTexture( 'img/texture.png'), side: THREE.DoubleSide });                       
                          skinMesh = new THREE.Mesh(geometry, material); 
                          scene.add( skinMesh);       
                       } );
             
               renderer = new THREE.WebGLRenderer();
               renderer.setSize( width, height );
               container.appendChild( renderer.domElement );
            }
         
  
            function animate() {            	 
                requestAnimationFrame( animate );             
                render();
            } 

            function render() {  
            	 camera.position.z = 70;   
	             camera.lookAt( scene.position );      	
	             renderer.render( scene, camera ); 
            }

         
           
            
           