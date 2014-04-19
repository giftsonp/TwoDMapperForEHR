/**
 * Author: Giftson David Paul 
 * 
 */
           var container, stats;
            var camera, scene, renderer, model, particleMaterial, zoom, rotate;
            var mouseX = 0, mouseY = 0;
            var width = 470;
            var height = 580;
            var material;
            var mesh;
   		    var windowHalfX = width / 2;
            var windowHalfY = height / 2;
        


            init();
            animate();


            function init() {

                container = document.getElementById('obj'); 
              
                scene = new THREE.Scene();

                addCamera(10, 11, 11);

                
                renderer = new THREE.WebGLRenderer();
                renderer.setSize( width, height );
               renderer.physicallyBasedShading = true;
                container.appendChild( renderer.domElement );          
              
  		
                /*  Lighting*/
                var ambient = new THREE.AmbientLight(0x111111 );
                scene.add( ambient );

                var directionalLight = new THREE.DirectionalLight( 0xffffff, 0.75 );
                directionalLight.position.set( 0, 0, 1 );
                scene.add( directionalLight ); 

               var pointLight = new THREE.PointLight( 0xffffff, 5, 29 );
      		    pointLight.position.set( 0, -25, 10 ); 
				        scene.add( pointLight );  
				
            	
            	var uniforms = {
            		   /*  texture: { type: "t", value: THREE.ImageUtils.loadTexture( "0.png" ) },
            		    texture1: { type: "t", value: THREE.ImageUtils.loadTexture( "1.png" ) },
            		    texture2: { type: "t", value: THREE.ImageUtils.loadTexture( "2.png" ) } */
            		};

            
             	var attributes = {}; 
            	  
                var material = new THREE.ShaderMaterial({
            		attributes      : attributes, 
            		uniforms        : uniforms,
             	 	vertexShader: document.getElementById( 'vertexShader' ).innerHTML,
            	    fragmentShader: document.getElementById( 'fragmentShader' ).innerHTML
            	});
                               
         

		        var loader = new THREE.OBJLoader();
                loader.load( "js/MaleDressed.obj", function ( object ) {
         
                  var  geometry = object.children[0].geometry;
				  console.log(geometry);
             
                  mesh = new THREE.Mesh(geometry, material);
	                scene.add(mesh); 
                } );
                
            }

            function animate() {
               requestAnimationFrame( animate );        
               mesh.rotation.y += 0.050; 
               render();
            } 

            function render() {
	                if(rotate) 
             mesh.rotation.z += 2;   
	                camera.position.z = 70;   
                camera.lookAt( scene.position );
                renderer.render( scene, camera ); 
            }

            function addCamera(x, y, z){
                camera = new THREE.PerspectiveCamera( 19, width / height, 1, 4000 );
                camera.position.x = x;
                camera.position.y = y;
                camera.position.z = z;
                scene.add( camera );
            } 

           