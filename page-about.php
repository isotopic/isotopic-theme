<?php
get_header();
get_template_part( 'page', 'header' );
 ?>


<div class="toolbar">
	<div class="container">
		<div class="row">

			<div class="col-xs-6 text-left" >
				<a href="<?php echo home_url();?>">
					<div class="toolbar-pill">
						<svg style="margin:0 0 -1px 0;" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"  width="10" height="16">
						    <path d="M6,5 L2,10 L6,15" style="stroke:#999; fill:none;" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="3"/>
						</svg>
					  home</div>
				</a>
			</div>

			<div class="col-xs-6 text-right" >


			</div>

		</div><!-- /row -->
	</div><!-- /container -->
</div><!-- /toolbar -->






<div class="content-panel about-content">
	<div class="container">
		<div class="row">

			<div class="col-sm-5 no-padding no-margin">

				<div class="about-item col-sm-12">
					<div class="about-item-wrapper about-info">
						<h3>Info</h3>
						<!--Foto, nome, local, função etc</p>-->

						<div class="about-info-header">
							<img src="<?php echo get_template_directory_uri(); ?>/img/about-avatar.png" class="img-circle">
							<h4>Guilherme Cruz <span>Web Developer</span></h4>
						</div>


						<div class="about-info-content">
							<div class="about-info-content-item">
								<h5>local</h5> <p>São paulo, Brasil</p>
							</div>
							<div class="about-info-content-item">
								<h5>funções</h5> <p>Desenvolvimento Front-end e Back-end</p>
							</div>
							<div class="about-info-content-item">
								<h5>experiência</h5> <p>Mais de 10 anos de experiência desenvolvendo projetos para clientes como Abn Amro, Levis, Natura, Mizuno, Johnsons, Hasbro, Brasil Kirin, Cacaushow, Grupo 3 Corações, entre outros.</p>
							</div>							
							<div class="about-info-content-item">
								<h5>educação</h5> <p>Publicidade e propaganda - ECA-USP incompleto. Sistemas de informação - EACH-USP incompleto. Tentei negociar e obter um diploma com as duas metades, mas não aceitaram :c</p>
							</div>
							<div class="about-info-content-item">
								<h5>objetivos</h5> <p>Participar de projetos surpreendentes, que sejam tão funcionais quanto divertidos.</p>
							</div>
							<div class="about-info-content-item">
								&nbsp;
							</div>

							<div class="about-info-social">
								<a href="mailto:guilhermecruz@gmail.com"><img src="<?php echo get_template_directory_uri(); ?>/img/email.png"></a>
								<a href="http://br.linkedin.com/in/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/linkedin.png"></a>
								<a href="https://github.com/isotopic" target="_blank"><img src="<?php echo get_template_directory_uri(); ?>/img/github.png"></a>
							</div>


						</div>

					</div>
				</div>





				<div class="about-item col-sm-12">
					<div class="about-item-wrapper about-skills">

						<h3>Skills</h3>



						<h4><img src="<?php echo get_template_directory_uri(); ?>/img/about1.png"> Interaction Design</h4>
						<p> Protótipos e projetos de interação para interfaces como websites, web apps, games e dashboards, além de interfaces low level como microcontroladores e linha de comando.</p>

						<h4><img src="<?php echo get_template_directory_uri(); ?>/img/about2.png"> Frontend Development</h4>
						<p> Utilizo ou já utilizei PixiJS, Three.js, Chart.js, D3, svg via js, Angular, Sass e Gulp. Tenho experiência na integração entre sistemas através de APIs REST ou SOAP. 
							Tenho experiência na produção, publicação e manutenção de apps nativos Android e iOS através de Phonegap. Gosto de desenvolver interfaces complexas que envolvam por ex. geometria.
							Tenho boas noções de diagramação, tipografia, fotografia e <a href="http://www.camiseteria.com/profile.aspx?usr=gu1lh3rme" target="_blank">ilustração</a>.
						</p>

						<h4><img src="<?php echo get_template_directory_uri(); ?>/img/about3.png"> Backend Development</h4>
						<p>Possuo conhecimento em Wordpress e Drupal.</p>
						<p>Já utilizei frameworks PHP como Cake e Yii, mas atualmente os favoritos são CodeIgniter e Slim. Fiz <a href="https://s3.amazonaws.com/edu-cert.10gen.com/downloads/3c43ae47c8fe41628beecd4d48aef57d/Certificate.pdf">um curso</a> de MongoDB para NodeJS developers.
							Tenho experiência em configuração e manutenção de servidores web linux, assim como setups de desenvolvimento local utilizando Virtual Box.
							Gosto de automatizar tarefas através de bash scripts <a href="https://github.com/isotopic/isotopic-local" target="_blank">como este</a>.</p>

					</div>
				</div>


			</div>



			<div class="col-sm-7  no-padding no-margin">

				<div class="about-item col-sm-12">
					<div class="about-item-wrapper">
						<h3>Timeline</h3>


						<div class="about-timeline" style="">

							<div class="about-timeline-year">
								<h4>2002</h4>
							</div>

								<div class="about-timeline-fact about-timeline-fact-work">
									<h5> <div>2002 <span>jan</span></div> Era uma vez</h5>
									<p>
										No início de 2002 publiquei a primeira versão do Isotopic — 
										na época um blog pessoal sobre design e programação —  criado para estudar técnicas e conhecer pessoas com o mesmo interesse.
										Apesar de não ter mais acesso ftp, ele <a href="http://isotopic.com.sapo.pt/v1/index.html" target="_blank">continua no ar</a> até hoje.
									</p>

								</div>




								<div class="about-timeline-fact about-timeline-fact-education">
									<h5><div>2003 <span>mar</span></div>Publicidade e Propaganda</h5>
									<p>
										Buscando uma formação generalista na área de comunicação e web design, iniciei o curso de Publicidade e Propaganda na ECA-USP no período matutino.
									</p>
								</div>


								<div class="about-timeline-fact about-timeline-fact-work">
									<h5> <div>2003 <span>jun</span></div> Estágios</h5>
									<p>
										Durante os primeiros semestres da faculdade atuava tanto na área de criação
										quanto na programação de interfaces, utilizando principalmente html, javascript e actionscript.
									</p>

								</div>



								<div class="about-timeline-fact about-timeline-fact-work">
									<h5> <div>2005 <span>jun</span></div> Agências</h5>
									<p>
										Já atuando exclusivamente em programação, me especializei em actionscript e em tecnologias server side como PHP e MySQL,
										e posteriormente nas principais libraries e frameworks javascript utilizadas atualmente em desenvolvimento frontend. 
									</p>

								</div>


								<div class="about-timeline-fact about-timeline-fact-education">
									<h5><div>2013 <span>mar</span></div>Sistemas de Informação</h5>
									<p>
										Com intuito de reforçar os conhecimentos de computação, iniciei o curso de Sistemas de Informação na EACH-USP no período noturno.
									</p>
								</div>




								<div class="about-timeline-fact about-timeline-fact-work">
									<h5> <div>2015 <span>nov</span></div> Hoje</h5>
									<p>
										Atualmente Lead Developer na agência Íonz.
									</p>

								</div>


							<div class="about-timeline-year">
								<h4>2016</h4>
							</div>



						</div>



					</div>
				</div>




				<div class="about-item col-sm-12 hidden">
					<div class="about-item-wrapper about-personal">

						<h3>Personal</h3>

						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="clearfix"></div>

					</div>
				</div>


				<div class="about-item col-sm-12 hidden">
					<div class="about-item-wrapper about-pdf">

						<h3>PDF version</h3>

						<div class="about-item col-xs-2">
							<p> <img src="<?php echo get_template_directory_uri(); ?>/img/about1.png" class="img-responsive"></p>
						</div>
						<div class="clearfix"></div>

					</div>
				</div>




			</div>

		</div>

	</div>

</div>














































<?php
get_template_part( 'page', 'footer' );
get_footer();
?>
