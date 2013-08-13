{*
 * =|= Layout ===================================================
 *
 * Master layout and structure of theme.
 * ==============================================================
 *}
 
{if !empty($display_header)}{include file='./header.tpl' HOOK_HEADER=$HOOK_HEADER}{/if}
{if !empty($template)}{$template}{/if}
{if !empty($display_footer)}{include file='./footer.tpl'}{/if}
{* Includes overlay features when using Live Edit from the Back Office *}
{if !empty($live_edit)}
	{$live_edit}
{/if}