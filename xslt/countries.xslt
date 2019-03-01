<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/countries">
        <xsl:for-each select="country">
            <xsl:result-document method="html" href="../html/{@iso-code}.html" indent="yes">
                <xsl:apply-templates select="."/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="country">
        <html>
            <head>
                <title>
                    <xsl:value-of select="government/country-name/@short-form"/>
                </title>

                <!-- CSS styles -->
                <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
                <link rel="stylesheet"
                      href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css"/>
                <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.0/build/pure-min.css"
                      integrity="sha384-nn4HPE8lTHyVtfCBi5yW9d20FjT8BJwUXyWZT9InLYax14RDjBj46LmSztkmNP9w"
                      crossorigin="anonymous"/>
                <link rel="stylesheet" href="style.css"/>

                <!-- JS scripts -->
                <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"/>
                <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"/>
            </head>
            <body>
                <div class="navbar-fixed">
                    <nav>
                        <div class="nav-wrapper">
                            <ul class="center hide-on-med-and-down">
                                <li>
                                    <a href="index.html">Index</a>
                                </li>
                                <li>
                                    <a href="#background">Background</a>
                                </li>
                                <li>
                                    <a href="#geography">Geography</a>
                                </li>
                                <li>
                                    <a href="#people-society">Society</a>
                                </li>
                                <li>
                                    <a href="#government">Government</a>
                                </li>
                                <li>
                                    <a href="#economy">Economy</a>
                                </li>
                                <li>
                                    <a href="#energy">Energy</a>
                                </li>
                                <li>
                                    <a href="#communications">Communications</a>
                                </li>
                                <li>
                                    <a href="#transportation">Transportation</a>
                                </li>
                                <li>
                                    <a href="#security">Military security</a>
                                </li>
                                <li>
                                    <a href="#transnational-issues">Transnational issues</a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                </div>

                <section id="country-name" class="section container">
                    <h2>
                        <xsl:value-of select="government/country-name/@short-form"/>
                    </h2>
                </section>

                <section id="overview" class="section container">
                    <xsl:apply-templates select="background"/>
                </section>

                <section id="gallery" class="section container">
                    <xsl:apply-templates select="images"/>
                </section>

                <section id="geography" class="section container">
                    <xsl:apply-templates select="geography"/>
                </section>

                <section id="people-society" class="section container">
                    <xsl:apply-templates select="people-society"/>
                </section>

                <section id="government" class="section container">
                    <xsl:apply-templates select="government"></xsl:apply-templates>
                </section>

                <section id="economy" class="section container">
                    <xsl:apply-templates select="economy"></xsl:apply-templates>
                </section>

                <section id="energy" class="section container">
                    <xsl:apply-templates select="energy"></xsl:apply-templates>
                </section>

                <section id="communications" class="section container">
                    <xsl:apply-templates select="communications"></xsl:apply-templates>
                </section>

                <section id="transportation" class="section container">
                    <xsl:apply-templates select="transportation"></xsl:apply-templates>
                </section>

                <section id="security" class="section container">
                    <xsl:apply-templates select="military-security"></xsl:apply-templates>
                </section>

                <section id="transnational-issues" class="section container">
                    <xsl:apply-templates select="transnational-issues"></xsl:apply-templates>
                </section>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="background">
        <h5>Background</h5>
        <p id="background">
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

    <xsl:template match="images">
        <h5>Image gallery</h5>
        <div id="images">
            <xsl:for-each select="image">
                <img class="materialboxed" width="200" src="{@source}" alt="{@caption}" data-caption="{@caption}" />
            </xsl:for-each>
        </div>
    </xsl:template>

    <xsl:template match="geography">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Geography</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Location:</td>
                    <td>
                        <xsl:value-of select="location/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Area:</td>
                    <td>
                        <xsl:value-of select="area/@land"></xsl:value-of><xsl:value-of
                            select="area/@unit"></xsl:value-of>,
                        <xsl:value-of select="area/@water"></xsl:value-of><xsl:value-of
                            select="area/@unit"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Coastline:</td>
                    <td>
                        <xsl:value-of select="coastline/@value"></xsl:value-of>
                        <xsl:value-of select="coastline/@unit"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Area comparison:</td>
                    <td>
                        <xsl:value-of select="area-comparative/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Map reference:</td>
                    <td>
                        <xsl:value-of select="map-references/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Climate:</td>
                    <td>
                        <xsl:value-of select="climate/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Terrain:</td>
                    <td>
                        <xsl:value-of select="terrain/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Natural resources:</td>
                    <td>
                        <xsl:value-of select="natural-resources/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Natural hazards:</td>
                    <td>
                        <xsl:value-of select="natural-hazards/@value"></xsl:value-of>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="people-society">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Society</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Population:</td>
                    <td>
                        <xsl:value-of select="people"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Median age (in <xsl:value-of select="median-age/@unit"></xsl:value-of>):
                    </td>
                    <td>
                        <ul>
                            <li>Male:
                                <xsl:value-of select="median-age/@male"></xsl:value-of>
                            </li>
                            <li>Female:
                                <xsl:value-of select="median-age/@female"></xsl:value-of>
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Ethnic groups:</td>
                    <td>
                        <ul>
                            <xsl:for-each select="ethnic-groups/ethnic-group">
                                <li>
                                    <xsl:choose>
                                        <xsl:when test="@percentage">
                                            <xsl:value-of select="@percentage"></xsl:value-of>%
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:value-of select="."></xsl:value-of>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Languages:</td>
                    <td>
                        <ul>
                            <xsl:for-each select="languages/language">
                                <li>
                                    <xsl:value-of select="."></xsl:value-of>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Religions:</td>
                    <td>
                        <ul>
                            <xsl:for-each select="religions/religion">
                                <li>
                                    <xsl:value-of select="@percentage"></xsl:value-of>%
                                    <xsl:value-of select="."></xsl:value-of>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Age structure:</td>
                    <td>
                        <ul>
                            <xsl:for-each select="age-structure/structure">
                                <li>
                                    <xsl:value-of select="@structure"></xsl:value-of>:
                                    <xsl:value-of select="@percentage"></xsl:value-of>%

                                </li>
                            </xsl:for-each>
                        </ul>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="government">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Government</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Type:</td>
                    <td>
                        <xsl:value-of select="@type"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Country names:</td>
                    <td>
                        <xsl:value-of select="country-name/@long-form"></xsl:value-of>,
                        <xsl:value-of select="country-name/@short-form"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Country divisions:</td>
                    <td>
                        <xsl:value-of select="administrative-divisions"/>
                    </td>
                </tr>
                <tr>
                    <td>Capital city:</td>
                    <td>
                        <xsl:value-of select="capital"></xsl:value-of>
                        <xsl:choose>
                            <xsl:when test="capital/@coordinate-n">
                                <xsl:value-of select="capital/@coordinate-n"></xsl:value-of>N
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="capital/@coordinate-s">
                                <xsl:value-of select="capital/@coordinate-s"></xsl:value-of>S
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="capital/@coordinate-e">
                                <xsl:value-of select="capital/@coordinate-e"></xsl:value-of>E
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="capital/@coordinate-w">
                                <xsl:value-of select="capital/@coordinate-w"></xsl:value-of>W
                            </xsl:when>
                        </xsl:choose>
                    </td>
                </tr>
                <tr>
                    <td>Independence date:</td>
                    <td>
                        <xsl:value-of select="independence/@date"></xsl:value-of>
                    </td>
                </tr>
                <xsl:choose>
                    <xsl:when test="constitution/@history">
                        <tr>
                            <td>Constitution history:</td>
                            <td>
                                <xsl:value-of select="constitution/@history"></xsl:value-of>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>
                <tr>
                    <td>Legal system:</td>
                    <td>
                        <xsl:value-of select="legal-system"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>International law:</td>
                    <td>
                        <xsl:value-of select="international-law"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Citizenship:</td>
                    <td>
                        <ul>
                            <li>By birth:
                                <xsl:value-of select="citizenship/@by-birth"></xsl:value-of>
                            </li>
                            <li>
                                By descent only:
                                <xsl:value-of select="citizenship/@by-descent-only"></xsl:value-of>
                            </li>
                            <li>
                                Dual citizenship recognized:
                                <xsl:value-of select="citizenship/@dual-citizenship-recognized"></xsl:value-of>
                            </li>
                            <li>
                                Residency requirement for naturalization:
                                <xsl:value-of
                                        select="citizenship/@residency-requirement-for-naturalization"></xsl:value-of>
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Executive branch:</td>
                    <td>
                        <ul>
                            <li>
                                Chief of state:
                                <xsl:value-of select="executive-branch/chief-of-state/@value"></xsl:value-of>
                            </li>
                            <li>
                                Head of government:
                                <xsl:value-of select="executive-branch/head-of-government/@value"></xsl:value-of>
                            </li>
                            <li>
                                Cabinet:
                                <xsl:value-of select="executive-branch/cabinet/@value"></xsl:value-of>
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>National symbols:</td>
                    <td>
                        <xsl:value-of select="national-symbols/@symbol"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>National anthem:</td>
                    <td>
                        Name:
                        <xsl:value-of select="national-anthem/@name"></xsl:value-of>
                        <br></br>
                        <br></br>
                        <audio controls="controls" src="{national-anthem/@source}"></audio>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="economy">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>
                        Economy
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Overview:</td>
                    <td>
                        <xsl:value-of select="overview"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Real growth rate:</td>
                    <td>
                        <ul>
                            <xsl:for-each select="gdps/real-growth-rate/growth-rate">
                                <li>
                                    To <xsl:value-of select="@to"></xsl:value-of>: <xsl:value-of
                                        select="."></xsl:value-of>%
                                </li>
                            </xsl:for-each>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Agriculture:</td>
                    <td>
                        <xsl:value-of select="agriculture/@products"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Industries:</td>
                    <td>
                        <xsl:value-of select="industries/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Taxes:</td>
                    <td>
                        <xsl:value-of select="taxes/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Public debt:</td>
                    <td>
                        <ul>
                            <xsl:for-each select="public-debt/debt">
                                <li>
                                    To <xsl:value-of select="@to"></xsl:value-of>: <xsl:value-of
                                        select="."></xsl:value-of>%
                                </li>
                            </xsl:for-each>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Imported commodities:</td>
                    <td>
                        <xsl:value-of select="imports/@commodities"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Import partners:</td>
                    <td>
                        <ol>
                            <xsl:for-each select="imports/partners/partner">
                                <li>
                                    <xsl:value-of select="."></xsl:value-of>:
                                    <xsl:value-of select="@percentage"></xsl:value-of>
                                </li>
                            </xsl:for-each>
                        </ol>
                    </td>
                </tr>
                <tr>
                    <td>Exported commodities:</td>
                    <td>
                        <xsl:value-of select="exports/@commodities"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Export partners:</td>
                    <td>
                        <ol>
                            <xsl:for-each select="exports/partners/partner">
                                <li>
                                    <xsl:value-of select="."></xsl:value-of>:
                                    <xsl:value-of select="@percentage"></xsl:value-of>
                                </li>
                            </xsl:for-each>
                        </ol>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="energy">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Energy</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Electricity:</td>
                    <td>
                        Access:
                        <xsl:value-of select="electricity/e-access/@total"></xsl:value-of>
                        <br></br>
                        Production:
                        <xsl:value-of select="electricity/e-production/@value"></xsl:value-of>
                        <br></br>
                        Consumption:
                        <xsl:value-of select="electricity/e-consumption/@value"></xsl:value-of>
                        <br></br>
                        Exports:
                        <xsl:value-of select="electricity/e-exports/@value"></xsl:value-of>
                        <br></br>
                        Imports:
                        <xsl:value-of select="electricity/e-imports/@value"></xsl:value-of>
                        <br></br>
                        Generating capacity:
                        <xsl:value-of select="electricity/e-generating-capacity/@value"></xsl:value-of>
                        <br></br>
                    </td>
                </tr>
                <tr>
                    <td>Crude oil:</td>
                    <td>
                        Production:
                        <xsl:value-of select="crude-oil/e-production/@value"></xsl:value-of>
                        <br></br>
                        Exports:
                        <xsl:value-of select="crude-oil/e-exports/@value"></xsl:value-of>
                        <br></br>
                        Imports:
                        <xsl:value-of select="crude-oil/e-imports/@value"></xsl:value-of>
                        <br></br>
                    </td>
                </tr>
                <tr>
                    <td>Petroleum:</td>
                    <td>
                        Production:
                        <xsl:value-of select="petroleum-products/e-production/@value"></xsl:value-of>
                        <br></br>
                        Consumption:
                        <xsl:value-of select="petroleum-products/e-consumption/@value"></xsl:value-of>
                        <br></br>
                        Exports:
                        <xsl:value-of select="petroleum-products/e-exports/@value"></xsl:value-of>
                        <br></br>
                        Imports:
                        <xsl:value-of select="petroleum-products/e-imports/@value"></xsl:value-of>
                        <br></br>
                    </td>
                </tr>
                <tr>
                    <td>Natural gas:</td>
                    <td>
                        Production:
                        <xsl:value-of select="natural-gas/e-production/@value"></xsl:value-of>
                        <br></br>
                        Consumption:
                        <xsl:value-of select="natural-gas/e-consumption/@value"></xsl:value-of>
                        <br></br>
                        Proved reserves:
                        <xsl:value-of select="natural-gas/e-proved-reserves/@value"></xsl:value-of>
                        <br></br>
                    </td>
                </tr>
                <tr>
                    <td>Carbon dioxide:</td>
                    <td>
                        <xsl:value-of select="carbon-dioxide/@value"></xsl:value-of>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="communications">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Communications</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Telephones:</td>
                    <td>
                        <ul>
                            <li>
                                No. of fixed lines:
                                <xsl:value-of select="telephones/fixed/@total"></xsl:value-of>
                            </li>
                            <li>
                                No. of mobile lines:
                                <xsl:value-of select="telephones/mobile/@total"></xsl:value-of>
                            </li>
                        </ul>
                    </td>
                </tr>
                <xsl:choose>
                    <xsl:when test="broadcast-media">
                        <tr>
                            <td>Broadcast media:</td>
                            <td>
                                <xsl:value-of select="."></xsl:value-of>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="internet">
                        <tr>
                            <td>Internet information:</td>
                            <td>
                                <ul>
                                    <li>
                                        Country code:
                                        <xsl:value-of select="internet/@country-code"></xsl:value-of>
                                    </li>
                                    <li>
                                        Users: <xsl:value-of select="internet/users/@total"></xsl:value-of>,
                                        percentage:
                                        <xsl:value-of select="internet/users/@percentage"></xsl:value-of>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </xsl:when>
                </xsl:choose>
            </tbody>
        </table>

    </xsl:template>

    <xsl:template match="transportation">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Transportation</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Roadways:</td>
                    <td>
                        <ul>
                            <li>Paved:
                                <xsl:value-of select="roadways/@paved"></xsl:value-of> km
                            </li>
                            <li>Unpaved:
                                <xsl:value-of select="roadways/@unpaved"></xsl:value-of> km
                            </li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td>Railways:</td>
                    <td>
                        Total: <xsl:value-of select="railways/@total"></xsl:value-of> km
                    </td>
                </tr>
                <tr>
                    <td>Airports:</td>
                    <td>
                        <xsl:value-of select="airports/@value"></xsl:value-of>
                    </td>
                </tr>
                <tr>
                    <td>Civil aircraft country code:</td>
                    <td>
                        <xsl:value-of select="civil-aircraft/@country-coude-prefix"></xsl:value-of>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="military-security">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Military security</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Branches:</td>
                    <td>
                        <xsl:value-of select="branches"></xsl:value-of>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xsl:template match="transnational-issues">
        <table class="pure-table pure-table-horizontal">
            <thead>
                <tr>
                    <td>Transnational issues</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Disputes:</td>
                    <td>
                        <xsl:value-of select="disputes"></xsl:value-of>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>