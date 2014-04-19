/**
 * Author: Giftson David Paul 
 * 
 */
         var container, stats;
        var camera, scene, renderer, model, particleMaterial;
        var mouseX = 0, mouseY = 0;
        var width = 450;
        var height = 570;

        var material; 
        var skinMesh, mesh1; 
		    var windowHalfX = width / 2;
        var windowHalfY = height / 2;
    	
    			
    			 

    		

            init();
            animate(); 


            function init() {

                container = document.getElementById('obj');

                scene = new THREE.Scene();

                addCamera(10, 11, 11);
				
					
					/*  var texture  = new THREE.ImageUtils.loadTexture('texture4.png'); */
					
			

      /*    		 zoom = camera.fov;  */
          		
               
          
                var ambient = new THREE.AmbientLight(0x111111 );
                scene.add( ambient );

                var directionalLight = new THREE.DirectionalLight( 0xffffff, 0.75 );
                directionalLight.position.set( 0, 0, 1 );
                scene.add( directionalLight ); 

               var pointLight = new THREE.PointLight( 0xffffff, 5, 29 );
      		    pointLight.position.set( 0, -25, 10 ); 
				        scene.add( pointLight );  

                var loader = new THREE.OBJLoader();
        
                	  loader.load( "js/Female.obj", function ( object ) {
                          object.children[0].geometry.computeFaceNormals();
                          var  geometry = object.children[0].geometry;
        				          console.log(geometry);
                          THREE.GeometryUtils.center(geometry);
                          geometry.dynamic = true;
                       
                       		
                     		  material = new THREE.MeshBasicMaterial( { map: THREE.ImageUtils.loadTexture( 'img/texture.png'), overdraw: true });
                  
                          
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

            function addCamera(x, y, z){
                camera = new THREE.PerspectiveCamera( 18, width / height, 1, 4000 );
                camera.position.x = x;
                camera.position.y = y;
                camera.position.z = z;
                scene.add( camera );
            } 

            function zoomIn(){
              camera.fov -= 1;
              camera.updateProjectionMatrix();
              zoom = camera.fov;
            }

            