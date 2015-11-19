<div id="disqus_thread"></div>
<script>
	var disqus_config = function () {
		this.page.url = "<?php echo get_permalink(); ?>";
		this.page.identifier = "<?php echo( basename( get_permalink() ) ); ?>";
	};
	(function() {
		var d = document, s = d.createElement('script');
		s.src = '//isotopic.disqus.com/embed.js';
		s.setAttribute('data-timestamp', +new Date());
		(d.head || d.body).appendChild(s);
	})();
</script>
<noscript>Javascript is required to view comments.</noscript>
