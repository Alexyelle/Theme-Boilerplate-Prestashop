 {*
 * =|= Footer ===================================================
 *
 * Footer et Hook right.
 * ==============================================================
 *}

		{if !$content_only}
		</div>

        {* Right sidebar *}
        <aside id="right_column" class="span3 sidebar">
            {$HOOK_RIGHT_COLUMN}
        </aside>

        </div> <!-- End #main -->
        </div> <!-- End .container -->
        {* Footer *}
        <footer class=" container">
            <div class="modules row">
                {$HOOK_FOOTER} 
            </div>               
            <ul>
                <li>&copy; 2013  |</li>
                <li><a href="">Conditions générales de ventes</a> |</li>
                <li><a href="">Mentions légales</a> |</li>
                <li><a href="">Plan du site</a></li>
            </ul>
        </footer>
	{/if}
    </body>
</html>