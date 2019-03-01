<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <fo:root>
            <!-- Nastavenie layoutu -->
            <fo:layout-master-set>
                <fo:simple-page-master master-name="A4-portrait" page-height="29.0cm" page-width="21.0cm" margin="2cm"
                                       margin-bottom="3cm">
                    <fo:region-body/>
                    <fo:region-after/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="A4-portrait">
                <!-- Zápätie -->
                <fo:static-content flow-name="xsl-region-after">
                    <fo:block text-align="center">
                        Page <fo:page-number/>
                    </fo:block>
                </fo:static-content>
                <!-- Úvodná strana -->
                <fo:flow flow-name="xsl-region-body">
                    <fo:block font-size="16pt" font-weight="400" text-align="center">
                        Countries
                    </fo:block>
                    <xsl:apply-templates/>
                </fo:flow>
            </fo:page-sequence>

        </fo:root>
    </xsl:template>

    <xsl:template match="countries">
        <fo:list-block provisional-distance-between-starts="0.3cm" provisional-label-separation="0.15cm"
                       margin-top="20pt">
            <xsl:for-each select="country">
                <fo:list-item>
                    <fo:list-item-label end-indent="label-end()">
                        <fo:block>
                            <fo:inline margin-left="10pt">&#xb7;</fo:inline>
                        </fo:block>
                    </fo:list-item-label>
                    <fo:list-item-body start-indent="body-start()">
                        <fo:block>
                            <fo:basic-link internal-destination="{@iso-code}" color="blue" text-decoration="underline">
                                <xsl:value-of select="government/country-name/@short-form"/>
                            </fo:basic-link>
                        </fo:block>
                    </fo:list-item-body>
                </fo:list-item>
            </xsl:for-each>
        </fo:list-block>
        <xsl:apply-templates select="country"/>
    </xsl:template>

    <xsl:template match="country">
        <fo:block page-break-before="always"/>

        <fo:block font-size="15pt" font-weight="bold" text-align="center">
            <xsl:attribute name="id">
                <xsl:value-of select="@iso-code"/>
            </xsl:attribute>
            <xsl:value-of select="government/country-name/@short-form"/>
        </fo:block>

        <fo:block padding-top="15pt">
            <fo:block font-weight="bold">Overview</fo:block>
            <xsl:value-of select="background"></xsl:value-of>
        </fo:block>

        <xsl:apply-templates select="images"/>
        <xsl:apply-templates select="geography" />
        <xsl:apply-templates select="people-society"/>
        <xsl:apply-templates select="government" />
        <xsl:apply-templates select="economy" />
        <xsl:apply-templates select="energy" />
        <xsl:apply-templates select="communications" />
        <xsl:apply-templates select="transportation" />
        <xsl:apply-templates select="military-security" />
        <xsl:apply-templates select="transnational-issues" />
    </xsl:template>

    <xsl:template match="images">
        <fo:block font-weight="bold" margin-top="10pt">Images</fo:block>
        <xsl:for-each select="image">
            <fo:block text-align="center" padding-top="25pt">
                <fo:block>
                    <fo:external-graphic height="150pt" content-width="scale-to-fit" scaling="uniform">
                        <xsl:attribute name="src">url('<xsl:value-of select="@source"/>')
                        </xsl:attribute>
                    </fo:external-graphic>
                </fo:block>
                <fo:block>
                    <xsl:value-of select="@caption"/>
                </fo:block>
            </fo:block>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="geography">
        <fo:block margin-top="10pt">
            <fo:table>
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-weight="bold">Geography</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Location:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="location/@value"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Area:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="area/@land" /><xsl:value-of
                                    select="area/@unit" />,
                                <xsl:value-of select="area/@water" /><xsl:value-of
                                    select="area/@unit" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Coastline:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="coastline/@value"/>
                                <xsl:value-of select="coastline/@unit"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Area comparison:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="area-comparative/@value"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Map reference:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="map-references/@value"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Climate:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="climate/@value"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Terrain:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="terrain/@value"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Natural resources:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="natural-resources/@value"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Natural hazards:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="natural-hazards/@value"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

    <xsl:template match="people-society">
        <fo:block page-break-before="always">
            <fo:block margin-top="10pt">
                <fo:table>
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block font-weight="bold">Society</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block font-weight="bold">Population:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block>
                                    <xsl:value-of select="people"></xsl:value-of>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block font-weight="bold">Median age (in <xsl:value-of
                                        select="median-age/@unit"></xsl:value-of>):
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block>
                                    Male: <xsl:value-of select="median-age/@male"></xsl:value-of>,
                                    Female:
                                    <xsl:value-of select="median-age/@female"></xsl:value-of>

                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block font-weight="bold">Ethnic groups:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block>
                                    <xsl:for-each select="ethnic-groups/ethnic-group">
                                        <fo:block>
                                            <xsl:choose>
                                                <xsl:when test="@percentage">
                                                    <xsl:value-of select="@percentage"></xsl:value-of>%
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:value-of select="."></xsl:value-of>
                                        </fo:block>
                                    </xsl:for-each>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block font-weight="bold">Languages:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <xsl:for-each select="languages/language">
                                    <fo:block>
                                        <xsl:value-of select="."></xsl:value-of>
                                    </fo:block>
                                </xsl:for-each>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block font-weight="bold">Religions:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <xsl:for-each select="religions/religion">
                                    <fo:block>
                                        <xsl:value-of select="@percentage"></xsl:value-of>%
                                        <xsl:value-of select="."></xsl:value-of>
                                    </fo:block>
                                </xsl:for-each>
                            </fo:table-cell>
                        </fo:table-row>
                        <fo:table-row>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block font-weight="bold">Age structure:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <xsl:for-each select="age-structure/structure">
                                    <fo:block>
                                        <xsl:value-of select="@structure"></xsl:value-of>:
                                        <xsl:value-of select="@percentage"></xsl:value-of>%
                                    </fo:block>
                                </xsl:for-each>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="government">
        <fo:block page-break-before="always">
            <fo:block margin-top="10pt">
                <fo:block>
                    <fo:table>
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Government</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Type:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="@type"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Country names:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="country-name/@long-form"></xsl:value-of>,
                                        <xsl:value-of select="country-name/@short-form"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Country divisions:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="administrative-divisions"/>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Capital city:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
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
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Independence date:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="independence/@date"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <xsl:choose>
                                <xsl:when test="constitution/@history">
                                    <fo:table-row>
                                        <fo:table-cell border="solid black 1px" padding="2px">
                                            <fo:block font-weight="bold">Constitution history:</fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell border="solid black 1px" padding="2px">
                                            <fo:block>
                                                <xsl:value-of select="constitution/@history"></xsl:value-of>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:when>
                            </xsl:choose>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Legal system:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="legal-system"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">International Law:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="international-law"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Citizenship:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>By birth:
                                        <xsl:value-of select="citizenship/@by-birth"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        By descent only:
                                        <xsl:value-of select="citizenship/@by-descent-only"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Dual citizenship recognized:
                                        <xsl:value-of select="citizenship/@dual-citizenship-recognized"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Residency requirement for naturalization:
                                        <xsl:value-of
                                                select="citizenship/@residency-requirement-for-naturalization"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Executive Branch:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        Chief of state:
                                        <xsl:value-of select="executive-branch/chief-of-state/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Head of government:
                                        <xsl:value-of
                                                select="executive-branch/head-of-government/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Cabinet:
                                        <xsl:value-of select="executive-branch/cabinet/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">National symbols:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="national-symbols/@symbol"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">National anthem:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        Name:
                                        <xsl:value-of select="national-anthem/@name"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="economy">
        <fo:block page-break-before="always">
            <fo:block margin-top="10pt">
                <fo:block>
                    <fo:block font-weight="bold">Economy</fo:block>
                    <fo:block>
                        <xsl:value-of select="overview"/>
                    </fo:block>
                    <fo:table margin-top="20pt">
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Real Growth Rate:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <xsl:for-each select="gdps/real-growth-rate/growth-rate">
                                        <fo:block>
                                            To <xsl:value-of select="@to"></xsl:value-of>: <xsl:value-of
                                                select="."></xsl:value-of>%
                                        </fo:block>
                                    </xsl:for-each>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Agriculture:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="agriculture/@products"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Industries:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="industries/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Taxes:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="taxes/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Public Debt:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <xsl:for-each select="public-debt/debt">
                                        <fo:block>
                                            To <xsl:value-of select="@to"></xsl:value-of>: <xsl:value-of
                                                select="."></xsl:value-of>%
                                        </fo:block>
                                    </xsl:for-each>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Imported comodities:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="imports/@commodities"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Import partners:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <xsl:for-each select="imports/partners/partner">
                                        <fo:block>
                                            <xsl:value-of select="."></xsl:value-of>:
                                            <xsl:value-of select="@percentage"></xsl:value-of>
                                        </fo:block>
                                    </xsl:for-each>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Exported comodities:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="exports/@commodities"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Export partners:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <xsl:for-each select="exports/partners/partner">
                                        <fo:block>
                                            <xsl:value-of select="."></xsl:value-of>:
                                            <xsl:value-of select="@percentage"></xsl:value-of>
                                        </fo:block>
                                    </xsl:for-each>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="energy">
        <fo:block page-break-before="always">
            <fo:block margin-top="10pt" text-align="justify">
                <fo:block>
                    <fo:table>
                        <fo:table-header>
                            <fo:table-row>
                                <fo:table-cell>
                                    <fo:block font-weight="bold">Energy</fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-header>
                        <fo:table-body>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Electricity:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        Access:
                                        <xsl:value-of select="electricity/e-access/@total"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Production:
                                        <xsl:value-of select="electricity/e-production/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Consumption:
                                        <xsl:value-of select="electricity/e-consumption/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Exports:
                                        <xsl:value-of select="electricity/e-exports/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Imports:
                                        <xsl:value-of select="electricity/e-imports/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Generating capacity:
                                        <xsl:value-of select="electricity/e-generating-capacity/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Crude oil:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        Production:
                                        <xsl:value-of select="crude-oil/e-production/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Exports:
                                        <xsl:value-of select="crude-oil/e-exports/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Imports:
                                        <xsl:value-of select="crude-oil/e-imports/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Petroleum:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        Production:
                                        <xsl:value-of select="petroleum-products/e-production/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Consumption:
                                        <xsl:value-of select="petroleum-products/e-consumption/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Exports:
                                        <xsl:value-of select="petroleum-products/e-exports/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Imports:
                                        <xsl:value-of select="petroleum-products/e-imports/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Natural gas:</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        Production:
                                        <xsl:value-of select="natural-gas/e-production/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Consumption:
                                        <xsl:value-of select="natural-gas/e-consumption/@value"></xsl:value-of>
                                    </fo:block>
                                    <fo:block>
                                        Proved reserves:
                                        <xsl:value-of select="natural-gas/e-proved-reserves/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                            <fo:table-row>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block font-weight="bold">Carbon Dioxide</fo:block>
                                </fo:table-cell>
                                <fo:table-cell border="solid black 1px" padding="2px">
                                    <fo:block>
                                        <xsl:value-of select="carbon-dioxide/@value"></xsl:value-of>
                                    </fo:block>
                                </fo:table-cell>
                            </fo:table-row>
                        </fo:table-body>
                    </fo:table>
                </fo:block>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="communications">
        <fo:block margin-top="10pt" text-align="justify">
            <fo:block>
                <fo:table>
                    <fo:table-header>
                        <fo:table-row>
                            <fo:table-cell>
                                <fo:block font-weight="bold">Communications</fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </fo:table-header>
                    <fo:table-body>
                        <fo:table-row>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block font-weight="bold">Telephones:</fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black 1px" padding="2px">
                                <fo:block>
                                    No. of fixed lines:
                                    <xsl:value-of select="telephones/fixed/@total"></xsl:value-of>
                                </fo:block>
                                <fo:block>
                                    No. of mobile lines:
                                    <xsl:value-of select="telephones/mobile/@total"></xsl:value-of>
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                        <xsl:choose>
                            <xsl:when test="broadcast-media">
                                <fo:table-row>
                                    <fo:table-cell border="solid black 1px" padding="2px">
                                        <fo:block font-weight="bold">Broadcast media:</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid black 1px" padding="2px">
                                        <fo:block>
                                            <xsl:value-of select="."></xsl:value-of>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:when>
                        </xsl:choose>
                        <xsl:choose>
                            <xsl:when test="internet">
                                <fo:table-row>
                                    <fo:table-cell border="solid black 1px" padding="2px">
                                        <fo:block font-weight="bold">Internet information</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell border="solid black 1px" padding="2px">
                                        <fo:block>
                                            Country code:
                                            <xsl:value-of select="internet/@country-code"></xsl:value-of>
                                        </fo:block>
                                        <fo:block>
                                            Users: <xsl:value-of select="internet/users/@total"></xsl:value-of>,
                                            percentage:
                                            <xsl:value-of select="internet/users/@percentage"></xsl:value-of>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </xsl:when>
                        </xsl:choose>
                    </fo:table-body>
                </fo:table>
            </fo:block>
        </fo:block>
    </xsl:template>

    <xsl:template match="transportation">
        <fo:block margin-top="10pt" text-align="justify">
            <fo:table>
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-weight="bold">Transportation</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Roadways:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>Paved:
                                <xsl:value-of select="roadways/@paved"></xsl:value-of> km
                            </fo:block>
                            <fo:block>Unpaved:
                                <xsl:value-of select="roadways/@unpaved"></xsl:value-of> km
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Railways:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                Total: <xsl:value-of select="railways/@total"></xsl:value-of> km
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Airports:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="airports/@value"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Civil aircraft country code:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="civil-aircraft/@country-coude-prefix"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

    <xsl:template match="military-security">
        <fo:block margin-top="10pt" text-align="justify">
            <fo:table>
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-weight="bold">Military security</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Branches:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="branches"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

    <xsl:template match="transnational-issues">
        <fo:block margin-top="10pt" text-align="justify">
            <fo:table>
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block font-weight="bold">Transnational issues</fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block font-weight="bold">Disputes:</fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black 1px" padding="2px">
                            <fo:block>
                                <xsl:value-of select="disputes"></xsl:value-of>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>
</xsl:stylesheet>