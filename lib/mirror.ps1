# Description: URL mirroring for GitHub and SourceForge downloads
#
# Configuration:
#   scoop config github_mirror_url <prefix>
#   scoop config sourceforge_mirror_url <prefix>
#
# Example:
#   scoop config github_mirror_url https://xxxxxx
#   scoop config sourceforge_mirror_url https://xxxxxx

function Invoke-UrlMirror {
    <#
    .SYNOPSIS
        Apply URL mirroring for GitHub/SourceForge download links.
    .DESCRIPTION
        If the URL matches GitHub.com or SourceForge.net and a mirror prefix
        is configured, show both the original and mirrored URLs, and return the
        mirrored URL. If no mirror is configured, show a hint on how to set it up.
        For non-mirrorable URLs, pass through silently.
    .PARAMETER Url
        The original download URL.
    .PARAMETER PassThru
        If specified, return the (possibly mirrored) URL.
    #>
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Url,
        [switch]$PassThru
    )

    # Show original URL
    Write-Host "URL: $Url" -ForegroundColor DarkGray

    $mirroredUrl = $Url

    # GitHub
    if ($Url -match 'github\.com') {
        $mirrorPrefix = get_config 'github_mirror_url'
        if ($mirrorPrefix) {
            $mirroredUrl = $mirrorPrefix.TrimEnd('/') + '/' + $Url
            Write-Host "Mirror: $mirroredUrl" -ForegroundColor Cyan
        } else {
            warn "GitHub mirror not configured. Use 'scoop config github_mirror_url <prefix>' to set."
        }
    }

    # SourceForge
    if ($Url -match 'sourceforge\.net') {
        $mirrorPrefix = get_config 'sourceforge_mirror_url'
        if ($mirrorPrefix) {
            $mirroredUrl = $mirrorPrefix.TrimEnd('/') + '/' + $Url
            Write-Host "Mirror: $mirroredUrl" -ForegroundColor Cyan
        } else {
            warn "SourceForge mirror not configured. Use 'scoop config sourceforge_mirror_url <prefix>' to set."
        }
    }

    if ($PassThru) { return $mirroredUrl }
}