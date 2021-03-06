var IsotopicHome = (function($){

    /**

    ANIMAÇÃO DA HOME DO SITE

    De maneira geral, a animação dos objetos consiste no seguinte esquema:

    > Registra-se no objeto (sprites) as referências aos elementos que devem ser animados.
      Esses elementos podem ser tanto objetos PIXI como também elementos DOM existentes na página.

    > Para cada objeto a ser animado, adiciona-se uma propriedade timeline, quem contém informações
      sobre os valores que o elemento deve ter em cada ponto no tempo (no caso, a posição da rolagem de 0 a 1).

      Exemplo: 

      //O objeto de referÊncias inicialmente vazio
      var sprites = {};

      //Registrada uma referência para um objeto PIXI
      sprites['algum_tile'] = PIXI.Sprite.fromFrame('algum_tile');

      //E agora as informações sobre como seus valores de y devem se comportar com relação ao key de 0 a 1.
      sprites['algum_tile'].timeline = [{ key:0.00, y:0   },
                                        { key:0.25, y:100 },
                                        { key:0.75, y:100 },
                                        { key:1.00, y:0   }];

      //Exemplo para adicionar um elemento DOM:
      sprites['item_train'] = document.getElementById("item_train") || {'style':{}};

      //Timeline no mesmo formato que para objetos pixi.
      sprites['item_train'].timeline = [{ key:0.00,  alpha:1 },
                                        { key:0.15,  alpha:0 },
                                        { key:1.00,  alpha:0 }];

      > Os elementos estão prontos para serem adicionados ao stage, através de:

      levelContainer.addChild( sprites['algum_tile'] );
      levelContainer.addChild( sprites['item_train'] );


      TL;DR

      Todos os elementos a serem animados devem ser referenciados no objeto sprites.
      Os elementos podem ser objetos PIXI, ou elementos DOM.
      Os elementos devem conter uma propriedade 'timeline', definindo o comportamento da animação.



    */




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




    /**
    *
    * Entry point
    *
    * O estado da animação é baseado no valor da variável window.ratio.
    * No caso de desktop, essa variável é atualizada pelo evento onScroll.
    * No caso de mobile, essa variável é atualizada pela função em MobileScroll.js, que utiliza eventos touch para detectar drags.
    *
    */
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



    /**
    *
    * Inicia objeto PIXI e preloader do spritesheet e mais um png solto (da sombra). 
    *
    */
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
        loader = new PIXI.AssetLoader([ path+"/img/sprites.json", path+"/img/shadow.png"]);
        loader.onComplete = onAssetsLoaded;
        loader.load();
    }





    /**
    *
    * Função para facilitar a inclusão de referências de elementos ao objeto sprite.
    * Recebe um nome que será a chave em sprites, e propriedades opcionais.
    *
    */
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


    /**
    *
    * Elementos já carregados, serão registrados no objeto sprite.
    *
    */
    function onAssetsLoaded(){ 

        var finalx;
        var finaly;
        var initx;
        var inity;
        var initrotation;
        var delay;
        

        //Registra NUVENS e SOMBRA
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




        //Registra os TILES que compoem o cenário. Nesse caso usa-se um loop para inserir a partir dessa matriz, garantindo as posições corretas.
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



        //Registra os VEÍCULOS em cima do cenário
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




        //Registra os itens do DOM para serem animados
        sprites['home_intro'] = document.getElementById("home_intro") || {'style':{}};
        sprites['item_airplane'] = document.getElementById("item_airplane") || {'style':{}};
        sprites['item_bus'] = document.getElementById("item_bus") || {'style':{}};
        sprites['item_ship'] = document.getElementById("item_ship") || {'style':{}};
        sprites['item_train'] = document.getElementById("item_train") || {'style':{}};

        sprites['home_intro'].timeline =
                [{ key:0.0,    x:null,  y:-200,   alpha:1},
                { key:0.15,    x:null,  y:-300,   alpha:0 },
                { key:1,    x:null,  y:-500,   alpha:0 }];

        finalx = 80;
        finaly = -155;
        sprites['item_airplane'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.9,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.94,  x:finalx,  y:finaly,   alpha:1 },
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];

        finalx = -80;
        finaly = -40;
        sprites['item_bus'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.92,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.96,  x:finalx,  y:finaly,   alpha:1 },
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];
        finalx = -100;
        finaly = 80;
        sprites['item_train'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.94,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.98,  x:finalx,  y:finaly,   alpha:1},
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];
        finalx = 125;
        finaly = 20;
        sprites['item_ship'].timeline = [
                { key:0,    x:finalx,  y:finaly+20,   alpha:0},
                { key:0.96,  x:finalx,  y:finaly+20,   alpha:0},
                { key:0.99,  x:finalx,  y:finaly,   alpha:1},
                { key:1,     x:finalx,  y:finaly,   alpha:1 }];


        document.getElementById('throbber').style.display = 'none';   
        appendCallToAction();
        updateScreen();

        //Inicia o loop de animação
        requestAnimFrame(animate);

    }














    function animate() {
        requestAnimFrame( animate );

        //Movimentação do container
        levelContainer.position.x = wW;
        levelContainer.position.y = wH + 300 - (400*easeOutQuad(ratio));

        //parallax no holder, se não for mobile
        if(!is_touch){
            holder_position = (50-(50*easeOutQuad(ratio)));
            holder.style['transform'] = "translate(0px, "+holder_position+"px)";
            holder.style['-ms-transform'] = "translate(0px, "+holder_position+"px)";
            holder.style['-webkit-transform'] = "translate(0px, "+holder_position+"px)";
        }


        //Percorre todos os elementos do objeto sprite que tenham o parâmetro timeline
        for(var key in sprites){

            //Array temporário para conter o valor inicial e o final, entre dois keyframes consecutivos nas timelines
            var keyframes = [];
            //Razão relativa para calcular a variação de valores entre dois keyframes consecutivos
            var relative_ratio = 0;

            if(sprites[key].timeline){


                //Percorre as variações de key dentro de uma timeline
                for(i=0;i<sprites[key].timeline.length-1;i++){

                    //Se o ratio global está incluso neste intervalo de keys, os valores de keyframes são usados para atualização
                    if(ratio >= sprites[key].timeline[i].key && ratio <= sprites[key].timeline[i+1].key){
                        keyframes[0] = sprites[key].timeline[i];
                        keyframes[1] = sprites[key].timeline[i+1];
                    }

                    //Só faz o cálculo se efetivamente tiver dois keyframes para poder calcular variação
                    if(keyframes.length==2){

                        //Normaliza o ratio global para um ratio local correspondendo à variação entre os dois keyframes
                        relative_ratio = (ratio - keyframes[0].key) /(keyframes[1].key-keyframes[0].key);

                        //Aplica efeito de easing usando equações do Robert Penner: http://upshots.org/actionscript/jsas-understanding-easing
                        relative_ratio = easeInOutQuad(relative_ratio);


                        var obj = sprites[key];

                        //Se for objeto PIXI, anima usando isso
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
                            //Se for DOM, anima usando isso
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


    //Penner's
    function easeInOutQuad(t) {
        t /= 1/2;
        if (t < 1) return 1/2*t*t;
        t--;
        return -1/2 * (t*(t-2) - 1);
    }
    function easeOutQuad(t) {
        return 1 - Math.pow(1 - t, 2);
    }


    //Chamada para scrolldown
    function appendCallToAction(){
        var cta = document.createElement("img");
        if(is_touch){
            cta.src = path +"/img/cta_mobile.svg";
            cta.style['margin-top'] = "0px";
            document.getElementById("home_intro").appendChild(cta);
            //interação touch 
            document.getElementById('item_airplane').addEventListener('touchend', itemTouch, false);
            document.getElementById('item_bus').addEventListener('touchend', itemTouch, false);
            document.getElementById('item_ship').addEventListener('touchend', itemTouch, false);
            document.getElementById('item_train').addEventListener('touchend', itemTouch, false);
        }else{
            cta.src = path +"/img/cta.svg";
            cta.style['margin-top'] = "0px";
            cta.style['cursor'] = "pointer";
            cta.addEventListener('click', introClick, false);
            document.getElementById("home_intro").appendChild(cta);
        }
    }


    //Atualização da global ratio para o caso de desktop
    function getRatioDesktop(){
        var body = document.body, html = document.documentElement;
        var height = Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight );
        ratio =  (document.documentElement.scrollTop || document.body.scrollTop) / (height - document.documentElement.clientHeight);
        if(ratio>1){ratio=1;}
    }

    //Atualização do tamanho do canvas
    function updateScreen(){
        wW = document.documentElement.clientWidth;
        wH = document.documentElement.clientHeight;
        renderer.resize( wW*2, wH*2 );
        //Ajustes hotspots
        if(wW<550){
            $('#item_airplane').addClass('home-item-lefty');
            $('#item_bus').removeClass('home-item-lefty');
            $('#item_ship').addClass('home-item-lefty');
            $('#item_train').removeClass('home-item-lefty');
        }else{
            $('#item_airplane').removeClass('home-item-lefty');
            $('#item_bus').addClass('home-item-lefty');
            $('#item_ship').removeClass('home-item-lefty');
            $('#item_train').addClass('home-item-lefty');
        }
    }

    //Em mobile, só libera os cliques nos labels se estiver quase terminada a animação de scroll
    function itemTouch(event){
        event.preventDefault();
        if(ratio>=0.986){
            event.target.click();
        }
    }

    //Ao clicar na seta, anima o scroll automaticamente
    function introClick(event){
        $('html, body').stop().animate({
                'scrollTop': $(document).height()-$(window).height()
        }, 3500, 'linear');
    }



    return {};

})(jQuery);