var IsotopicHome = (function($){


    window.ratio = 0;
    var path = window.isotopic_template_path;
    var wW = document.documentElement.clientWidth;
    var wH = document.documentElement.clientHeight;
    var stage;
    var renderer;
    var levelContainer;
    var loader;
    var holder;
    var sprites = {};
    var is_touch  = 'ontouchstart' in window || 'msmaxtouchpoints' in window.navigator;



    $(document).ready(function(){
        if(is_touch){
            document.getElementById('scroller').style.display = 'none';
            var mobileScroll = new IsotopicMobileScroller({element:document.getElementById("holder")});
        }else{
            window.addEventListener("scroll", getRatioDesktop);
        }
        window.addEventListener("resize", updateScreen);
        setup();
    });




    function setup(){
        stage = new PIXI.Stage();
        PIXI.dontSayHello  = true;
        renderer =
        PIXI.autoDetectRenderer(600, 600, {
            antialiasing:false,
            transparent:true,
            resolution:0.5
        });
        holder = document.getElementById("holder");
        holder.appendChild(renderer.view);
        levelContainer = new PIXI.DisplayObjectContainer();
        stage.addChild(levelContainer);
        updateScreen();
        //http://www.leshylabs.com/apps/sstool = json HASH e adicionar  parametro "image": "spritesheet.png" no meta
        loader = new PIXI.AssetLoader([ path+"/img/sprites.json", path+"/img/shadow.png"]);
        loader.onComplete = onAssetsLoaded;
        loader.load();
    }






    function extraChild(_options){
        if(_options && _options.name){
            sprites[_options.name] = PIXI.Sprite.fromFrame(_options.name);
            sprites[_options.name].position.x = _options.x || 0;
            sprites[_options.name].position.y = _options.y || 0;
            sprites[_options.name].anchor.x = _options.anchorX || 0;
            sprites[_options.name].anchor.y = _options.anchorY || 0;
            sprites[_options.name].scale.x = _options.scaleX || 1;
            sprites[_options.name].scale.y = _options.scaleY || 1;
            sprites[_options.name].timeline = _options.timeline || [];
            levelContainer.addChild( sprites[_options.name] );
        }
    }


    function onAssetsLoaded(){  //Elementos inseridos de acordo com z index: nuvens e sombra, cenario, veiculos


        var finalx;
        var finaly;
        var initx;
        var inity;
        var initrotation;
        var delay;
        

        // NUVENS E SOMBRA
         extraChild({ name:"cloud1", timeline:  [
            { key:0.0,        x:390,  y:-200,   alpha:0, rotation:0},
            { key:1.0,        x:390,  y:-100,   alpha:0.9, rotation:0}]   });

        extraChild({ name:"cloud2", timeline:  [
           { key:0.0,     x:-500,  y:-300,   alpha:0, rotation:0},
             { key:1.0,    x:-500,  y:-150,   alpha:0.8, rotation:0}]   });

        extraChild({ name:"cloud3", timeline:  [
            { key:0.0,        x:-200,  y:-500,   alpha:0, rotation:0},
             { key:1.0,       x:-200,  y:-300,   alpha:0.7, rotation:0}]  });

        extraChild({ name:path+"/img/shadow.png", anchorX:0.5, anchorY:0.5, scaleX:2, scaleY:2, timeline:  [
            { key:0.0,        x:0,  y:450,   alpha:0, rotation:0},
            { key:0.6,        x:0,  y:400,   alpha:0, rotation:0},
            { key:1.0,        x:0,  y:400,   alpha:0.6, rotation:0}]   });


        // CENARIO (inseridos com um loop)
        var tiles = [
            [2, 'land067bn'], [0, 'land098'], [0, 'land043'], [0, 'land058'], [0, 'land099'], [2, 'land099'], [2, 'gui2c'], [2, 'gui2b'], [2, 'land098'], [0, 'gui2bw'],
            [2, 'land067'], [0, 'land098'], [0, 'land043'], [0, 'land058'], [0, 'land099'], [2, 'land029'], [2, 'land106'], [2, 'land106'], [2, 'land036'], [0, 'gui2c'],
            [0, 'land106'], [0, 'land036'], [0, 'land063'], [0, 'land070'], [0, 'land029'], [0, 'land106'], [0, 'land106'], [0, 'city018'], [0, 'land106'], [0, 'land106'],
            [0, 'city081'], [0, 'city081'], [0, 'city081'], [0, 'city081'], [0, 'city081'], [0, 'city000'], [0, 'city056'], [0, 'city088'], [0, 'city081'], [0, 'city081'],
            [0, 'land067'], [0, 'land067c'], [0, 'land067'], [0, 'land067'], [0, 'land067'], [0, 'land067'], [0, 'land067c'], [0, 'land067'], [0, 'land067'], [0, 'land067c'],
            [0, 'land067b'], [0, 'land067'], [0, 'land067'], [0, 'land067'], [0, 'land067b'], [0, 'land067'], [0, 'land067'], [0, 'land067'], [0, 'land067'], [0, 'land067'],
            [0, 'gui1'], [0, 'gui1'], [0, 'gui1'], [0, 'gui1'], [0, 'gui1'], [0, 'gui1'], [0, 'gui1'], [0, 'gui1'], [0, 'gui1'], [0, 'gui1'],
            [0, 'land034'], [0, 'land034'], [0, 'land034'], [0, 'land034'], [0, 'land034'], [0, 'land034'], [0, 'land034'], [0, 'land034'], [0, 'land034'], [0, 'land034'],
            [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'],
            [0, 'land066e'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066'], [0, 'land066s']];

        var sides = 10;
        var line = 0;
        var row = 0;
        var offx = 0;
        var offy = 0;
        var floorH = 16;

        for(var a=0; a<tiles.length; a++){

            sprites["tile"+a] = PIXI.Sprite.fromFrame(tiles[a][1]);
            sprites["tile"+a].anchor.x = 0.5;
            sprites["tile"+a].anchor.y = 1;
            finalx = -line*65 + offx;
            finaly = row*32.5 + offy -  (floorH*tiles[a][0]);
            sprites["tile"+a].position.x = finalx;
            sprites["tile"+a].position.y = finaly;

            initx = finalx + 300;
            inity = finaly + 150;
            initrotation =0;
            delay = (0.5*a/tiles.length) + (0.05*Math.random());
            sprites["tile"+a].timeline = [
                { key:0.0,         x:initx,  y:inity,   alpha:0, rotation:initrotation},
                { key:0.05+delay,   x:initx,  y:inity,   alpha:0, rotation:initrotation},
                { key:0.2+delay,   x:finalx,  y:finaly,   alpha:1, rotation:0 },
                { key:1.0,         x:finalx,  y:finaly,   alpha:1, rotation:0}];
            //Ordenação dos keyframes por tempo
            for(var i=0;i<sprites["tile"+a].timeline.length;i++){
                sprites["tile"+a].timeline.sort(function(a,b) {
                    return parseFloat(a.key) - parseFloat(b.key);
                });
            }
            line++;
            row++;
            if(line>=sides){
                line=0;
                row=0;
                offx += 65;
                offy += 32.5;
            }
            levelContainer.addChild( sprites["tile"+a] );
        }


        //VEICULOS
        var delta = 0;

        delta = -320;
        finalx = -135; finaly = 233;
        initx = finalx - delta; inity = finaly + (delta/2);
        extraChild({ name:"bus", anchorX:0.5, anchorY:1, timeline: [
                { key:0.0,   x:initx,  y:inity,   alpha:0 },
                { key:0.45,  x:initx,  y:inity,   alpha:0 },
                { key:0.55,   x:initx ,  y:inity,   alpha:1 },
                { key:0.7,  x:finalx ,  y:finaly,   alpha:1 },
                { key:1.0,  x:finalx,  y:finaly,   alpha:1 }]  });

        delta = -500;
        finalx = 200; finaly = 200;
        initx = finalx - delta; inity = finaly + (delta/2);
        extraChild({ name:"airplane", anchorX:0.5, anchorY:1, timeline: [
                { key:0.0,        x:initx,  y:inity,   alpha:0 },
                { key:0.3,        x:initx,  y:inity,   alpha:0 },
                { key:0.5,       x:finalx,  y:finaly,   alpha:1 },
                { key:1.0,        x:finalx,  y:finaly,   alpha:1 } ]   });

        delta = -260;
        finalx = -24; finaly = 455;
        initx = finalx - delta; inity = finaly + (delta/2);
        extraChild({ name:"train", anchorX:0.5, anchorY:1, timeline: [
               { key:0.0,         x:initx,  y:inity,   alpha:0 },
               { key:0.65,         x:initx,  y:inity,   alpha:0 },
                { key:0.75,        x:initx, y:inity,   alpha:1 },
                { key:0.9,        x:finalx,  y:finaly,   alpha:1 },
                { key:1.0,         x:finalx,  y:finaly,   alpha:1}]  });

        delta = -220;
        finalx = 200; finaly = 510;
        initx = finalx - delta; inity = finaly + (delta/2);
         extraChild({ name:"ship", anchorX:0.5, anchorY:1, timeline: [
                { key:0.0,        x:initx,  y:inity,   alpha:0 },
                { key:0.8,       x:initx,  y:inity,   alpha:0 },
                { key:0.87,       x:initx,  y:inity,   alpha:1},
                { key:0.95,       x:finalx,  y:finaly,   alpha:1 },
                { key:1.0,        x:finalx,  y:finaly,   alpha:1 }]   });




        //Itens do DOM para serem animados
        sprites['home_intro'] = document.getElementById("home_intro") || {'style':{}};
        sprites['item_about'] = document.getElementById("item_about") || {'style':{}};
        sprites['item_projects'] = document.getElementById("item_projects") || {'style':{}};
        sprites['item_blog'] = document.getElementById("item_blog") || {'style':{}};
        sprites['item_contact'] = document.getElementById("item_contact") || {'style':{}};

        sprites['home_intro'].timeline =
                [{ key:0.0,    x:null,  y:-200,   alpha:1},
                { key:0.15,    x:null,  y:-300,   alpha:0 },
                { key:1,    x:null,  y:-500,   alpha:0 }];

        finalx = 80;
        finaly = -155;
        sprites['item_about'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.9,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.94,  x:finalx,  y:finaly,   alpha:1 },
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];

        finalx = -80;
        finaly = -40;
        sprites['item_projects'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.92,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.96,  x:finalx,  y:finaly,   alpha:1 },
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];
        finalx = -100;
        finaly = 80;
        sprites['item_contact'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.94,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.98,  x:finalx,  y:finaly,   alpha:1},
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];
        finalx = 125;
        finaly = 20;
        sprites['item_blog'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.96,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.99,  x:finalx,  y:finaly,   alpha:1},
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];


        document.getElementById('throbber').style.display = 'none';   
        appendCallToAction();
        updateScreen();
        requestAnimFrame(animate);

    }














    function animate() {
        requestAnimFrame( animate );

        levelContainer.position.x = wW;
        levelContainer.position.y = wH + 300 - (400*easeOutQuad(ratio));

        if(!is_touch){
            holder_position = (50-(50*easeOutQuad(ratio)));
            holder.style['transform'] = "translate(0px, "+holder_position+"px)";
            holder.style['-ms-transform'] = "translate(0px, "+holder_position+"px)";
            holder.style['-webkit-transform'] = "translate(0px, "+holder_position+"px)";
        }
        for(var key in sprites){

            var keyframes = [];
            var relative_ratio = 0;

            if(sprites[key].timeline){

                for(i=0;i<sprites[key].timeline.length-1;i++){

                    if(ratio >= sprites[key].timeline[i].key && ratio <= sprites[key].timeline[i+1].key){
                        keyframes[0] = sprites[key].timeline[i];
                        keyframes[1] = sprites[key].timeline[i+1];
                    }

                    if(keyframes.length==2){
                        relative_ratio = (ratio - keyframes[0].key) /(keyframes[1].key-keyframes[0].key);
                        relative_ratio = easeInOutQuad(relative_ratio);
                        var obj = sprites[key];
                            //objeto pixi
                        if(obj.position!==undefined){
                            if( keyframes[0].x !==undefined){
                                obj.position.x = keyframes[0].x + relative_ratio*(keyframes[1].x - keyframes[0].x);
                            }
                           if( keyframes[0].y !==undefined){
                                obj.position.y = keyframes[0].y + relative_ratio*(keyframes[1].y - keyframes[0].y);
                           }
                            if(keyframes[0].alpha!==undefined){
                                obj.alpha = keyframes[0].alpha + relative_ratio*(keyframes[1].alpha - keyframes[0].alpha);
                            }
                             if(keyframes[0].rotation!==undefined){
                                obj.rotation = keyframes[0].rotation + relative_ratio*(keyframes[1].rotation - keyframes[0].rotation);
                            }
                        }else{
                            //dom elements
                            x=0; y=0;
                            if(keyframes[0].x){
                                x =wW/2 + (keyframes[0].x + relative_ratio*(keyframes[1].x - keyframes[0].x));
                            }
                            if(keyframes[0].y){
                                y = wH/2 + (keyframes[0].y + relative_ratio*(keyframes[1].y - keyframes[0].y));
                            }
                            x = Math.round(x);
                            y = Math.round(y);
                            obj.style['transform'] = "translate( "+x+"px, "+y+"px)";
                            obj.style['-ms-transform'] = "translate( "+x+"px, "+y+"px)";
                            obj.style['-webkit-transform'] = "translate( "+x+"px, "+y+"px)";
                            obj.style['opacity'] = keyframes[0].alpha + relative_ratio*(keyframes[1].alpha - keyframes[0].alpha);
                        }
                    }

                }
            }

        }
        renderer.render(stage);
    }


    function easeInOutQuad(t) {
        t /= 1/2;
        if (t < 1) return 1/2*t*t;
        t--;
        return -1/2 * (t*(t-2) - 1);
    }


    function easeOutQuad(t) {
        return 1 - Math.pow(1 - t, 2);
    }



    function appendCallToAction(){
        var cta = document.createElement("img");
        if(is_touch){
            cta.src = path +"/img/cta_mobile.svg";
            cta.style['margin-top'] = "0px";
            document.getElementById("home_intro").appendChild(cta);
            //interação touch 
            document.getElementById('item_about').addEventListener('touchend', itemTouch, false);
            document.getElementById('item_projects').addEventListener('touchend', itemTouch, false);
            document.getElementById('item_blog').addEventListener('touchend', itemTouch, false);
            document.getElementById('item_contact').addEventListener('touchend', itemTouch, false);
        }else{
            cta.src = path +"/img/cta.svg";
            cta.style['margin-top'] = "0px";
            cta.style['cursor'] = "pointer";
            cta.addEventListener('click', introClick, false);
            document.getElementById("home_intro").appendChild(cta);
        }
    }



    function getRatioDesktop(){
        var body = document.body, html = document.documentElement;
        var height = Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight );
        ratio =  (document.documentElement.scrollTop || document.body.scrollTop) / (height - document.documentElement.clientHeight);
        if(ratio>1){ratio=1;}
    }

    function updateScreen(){
        wW = document.documentElement.clientWidth;
        wH = document.documentElement.clientHeight;
        renderer.resize( wW*2, wH*2 );
        //Ajustes hotspots
        if(wW<550){
            $('#item_about').addClass('home-item-lefty');
            $('#item_projects').removeClass('home-item-lefty');
            $('#item_blog').addClass('home-item-lefty');
            $('#item_contact').removeClass('home-item-lefty');
        }else{
            $('#item_about').removeClass('home-item-lefty');
            $('#item_projects').addClass('home-item-lefty');
            $('#item_blog').removeClass('home-item-lefty');
            $('#item_contact').addClass('home-item-lefty');
        }
    }


    function itemTouch(event){
        event.preventDefault();
        if(ratio>=0.985){
            event.target.click();
        }
    }

    function introClick(event){
        $('html, body').stop().animate({
                'scrollTop': $(document).height()-$(window).height()
        }, 3500, 'linear');
    }



    return {};

})(jQuery);