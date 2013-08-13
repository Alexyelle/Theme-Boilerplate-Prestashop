 {*
 * =|= Footer ===================================================
 *
 * Footer et Hook right.
 * ==============================================================
 *}

		{if !$content_only}
		</div>

        {* Right sidebar *}
        <aside id="right_column" class="sidebar">
            {$HOOK_RIGHT_COLUMN}
        </aside>

        {* Footer *}
        <footer>
            <div class="modules">
                {$HOOK_FOOTER}
            </div>
        </footer>
	{/if}
    </body>
</html>