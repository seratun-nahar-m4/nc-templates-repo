<?xml version="1.0" encoding="UTF-8"?>
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
<!--!                                                              !-->
<!--!    File Name    : adl_hawb_template.xsl                      !-->
<!--!    Description  : Addison Lee HAWB template                  !-->
<!--!    Author       : Abedur Rahman Panna                        !-->
<!--!    Date         :  05/12/2012                                !-->
<!--!    Copyright    : Copyright (c) M.F. Systems, 2012           !-->
<!--!    Info         :						   !-->
<!--!								   !-->
<!--!                                                              !-->
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" 
exclude-result-prefixes="fo" xmlns:java="com.metafour.netcourier.util.FopHelper" extension-element-prefixes="java">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element: statement template -->
  <!-- ========================= -->
  <xsl:template match="netc">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="A4" page-height="29.02cm" page-width="21cm"
          margin-top="4mm" margin-bottom="0mm" margin-left="6mm" margin-right="5mm">
          <fo:region-body margin-top="0mm" margin-left="0mm" margin-right="0mm" margin-bottom="0mm"/>
          <fo:region-before extent="0mm"/>
          <fo:region-after extent="0mm"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
	  <!-- First page -->
      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container height="145mm" width="21cm" left="0mm" top="0mm" position="absolute">
            <xsl:apply-templates select="hawb"/>
          </fo:block-container>
          <fo:block-container height="145mm" width="21cm" left="0mm" top="147.75mm" position="absolute">
            <xsl:apply-templates select="hawb"/>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
      <!-- Second page -->
	  <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container height="145mm" width="21cm" left="0mm" top="0mm" position="absolute">
            <xsl:apply-templates select="hawb"/>
          </fo:block-container>
          <fo:block-container height="145mm" width="21cm" left="0mm" top="147.75mm" position="absolute">
            <xsl:apply-templates select="hawb"/>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
	  <!-- Third page -->
      <fo:page-sequence master-reference="A4">
        <fo:flow flow-name="xsl-region-body">
          <fo:block-container height="145mm" width="21cm" left="0mm" top="0mm" position="absolute">
            <xsl:apply-templates select="hawb"/>
          </fo:block-container>
          <fo:block-container height="145mm" width="21cm" left="0mm" top="147.75mm" position="absolute">
            <xsl:apply-templates select="hawb"/>
          </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>


  <xsl:template match="hawb">
   <fo:block-container border="0" width="35mm" height="30mm" left="0mm" top="0mm" position="absolute">
      <xsl:call-template name="logo"/>
    </fo:block-container>
    <fo:block-container height="8mm" width="100mm" left="0mm" top="22mm" position="absolute">
      <xsl:call-template name="title"/>
    </fo:block-container>
      <fo:block-container height="50mm" width="65mm" left="65mm" top="0mm" position="absolute">
          <fo:block text-align="center" space-before.optimum="0pt" vertical-align="top" border-width=".0pt" border-color="#000000" border-style="solid">                
				<xsl:call-template name="barcode">                                                                     					<xsl:with-param name="awbn"><xsl:value-of select="cs_awbn"/></xsl:with-param>
					<xsl:with-param name="startStop">false</xsl:with-param>
					<xsl:with-param name="humanReadable">true</xsl:with-param>
					<xsl:with-param name="barcodeHeight">14</xsl:with-param>
					<xsl:with-param name="fontSize">10</xsl:with-param>					
				  </xsl:call-template>
			  </fo:block>
    </fo:block-container>
	
    <fo:block-container height="26mm" width="67mm" left="130mm" top="0.05mm" position="absolute">
      <xsl:call-template name="awb_info"/>
    </fo:block-container>

    <fo:block-container height="42mm" width="100mm" left="0mm" top="28mm" position="absolute">
       <xsl:call-template name="sndr_addr"/>
    </fo:block-container>
    <fo:block-container height="42mm" width="94mm" left="103mm" top="28mm" position="absolute">
      <xsl:call-template name="dest_addr"/>
    </fo:block-container>

    <fo:block-container height="11mm" width="100mm" left="0mm" top="69mm" position="absolute">
       <xsl:call-template name="job_details_prompt"/>
    </fo:block-container>
    <fo:block-container height="11mm" width="94mm" left="103mm" top="69mm" position="absolute">
       <xsl:call-template name="third_party"/>
    </fo:block-container>

    <fo:block-container height="30mm" width="150mm" left="0mm" top="82mm" position="absolute">
       <xsl:call-template name="service"/>
    </fo:block-container>

    <fo:block-container height="30mm" width="45mm" left="152mm" top="82mm" position="absolute">
      <xsl:call-template name="cons_value"/>
    </fo:block-container>

    <fo:block-container height="24mm" width="54mm" left="0mm" top="104mm" position="absolute">
      <xsl:call-template name="shiper_sig"/>
    </fo:block-container>
    <fo:block-container height="23mm" width="54mm" left="56mm" top="104mm" position="absolute">
      <xsl:call-template name="driver_sig"/>
    </fo:block-container>

     <fo:block-container height="23mm" width="85mm" left="112mm" top="104mm" position="absolute">
      <xsl:call-template name="deliver_cons"/>
    </fo:block-container>

    <fo:block-container height="6mm" width="194mm" left="0mm" top="127mm" position="absolute">
      <xsl:call-template name="botton"/>
    </fo:block-container> 
  </xsl:template>

<!--  <xsl:template name="logo">
    <fo:block>
      <xsl:variable name="imagepath" select="concat('file:',image_path,'adl_logo_pdf.jpg')"/>
      <fo:external-graphic border="0" src="{$imagepath}"/>
    </fo:block>
  </xsl:template>-->

<xsl:template name="logo">
    <fo:block>
      <xsl:variable name="imagepath" select="concat('file:',/netc/hawb/image_path,'adl_logo.jpg')"/>
      <fo:external-graphic padding="0" margin="0" space-start="0" space-end="0" pause-before="0" pause-after="0" content-height="18mm" content-width="45mm" scaling="non-uniform" src="{$imagepath}"/>
    </fo:block>
 </xsl:template>

  <xsl:template name="title">
    <fo:block font-size="7pt">
      <xsl:if test="cr_adr1 != ''">
        <xsl:value-of select="cr_adr1"/>
      </xsl:if>
      <xsl:if test="cr_adr2 != ''">
        , <xsl:value-of select="cr_adr2"/>
      </xsl:if>
      <xsl:if test="cr_adr3 != ''">
        , <xsl:value-of select="cr_adr3"/>
      </xsl:if>
      <xsl:if test="cr_zpcd != ''">
        , <xsl:value-of select="cr_zpcd"/>
      </xsl:if>
    </fo:block>
    <fo:block font-size="7pt">
      <xsl:if test="cr_phon != ''">
        Tel: <xsl:value-of select="cr_phon"/>
      </xsl:if>
      &#160;&#160;&#160;&#160;
      <xsl:if test="cr_faxn != ''">
        Fax: <xsl:value-of select="cr_faxn"/>
      </xsl:if>
    </fo:block>
  </xsl:template>


  <xsl:template name="cr_phon_info">
    <fo:block font-size="5pt" text-align="right">Operations : Tel: 01753 210110 &#160;&#160;&#160; Fax: 01753 687 003</fo:block>
    <fo:block font-size="5pt" text-align="left">&#160;&#160; Accounts &#160; :&#160;Tel: 01322 424703</fo:block>
  </xsl:template>

  <xsl:template name="awb_info">
    <fo:block font-size="8pt" width="67mm">
      <fo:table border="solid .3pt #000000" table-layout="fixed" width="67mm">
        <fo:table-column column-width="37mm"/>
        <fo:table-column column-width="30mm"/>
        <fo:table-body>
          <fo:table-row background-color="#e1e1e1" height="6mm" display-align="center">
            <fo:table-cell
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
              border-left-width=".3pt" border-left-color="#000000" border-left-style="solid">
              <fo:block font-size="9pt" font-weight="bold">&#160;AIRWAY BILL NUMBER</fo:block>
            </fo:table-cell>
            <fo:table-cell
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
              border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
              <fo:block text-align="right" font-size="10pt" font-weight="bold">&#160;<xsl:value-of select="cs_awbn"/></fo:block>
            </fo:table-cell>
          </fo:table-row>

          <fo:table-row height="2mm">
            <fo:table-cell number-columns-spanned="2"><fo:block>&#160;</fo:block></fo:table-cell>
          </fo:table-row>

          <fo:table-row height="4mm">
            <fo:table-cell><fo:block font-weight="bold">&#160;DATE </fo:block></fo:table-cell>
            <fo:table-cell>
              <fo:block font-weight="bold"> &#160;<xsl:value-of select="cs_bkdt"/></fo:block>
            </fo:table-cell>
          </fo:table-row>

          <fo:table-row height="4mm">
            <fo:table-cell font-weight="bold"><fo:block>&#160;WEIGHT </fo:block></fo:table-cell>
            <fo:table-cell>
              <xsl:if test="cs_twgt">
                <fo:block font-weight="bold" font-size="10pt"> &#160;<xsl:value-of select="cs_twgt"/>&#160;kgs </fo:block>
              </xsl:if>
            </fo:table-cell>
          </fo:table-row>

         <!--
          <fo:table-row height="4mm">
            <fo:table-cell font-weight="bold"><fo:block>&#160;VOL WEIGHT </fo:block></fo:table-cell>
            <fo:table-cell>
              <fo:block font-weight="bold"> &#160;<xsl:value-of select="cs_vlwe"/></fo:block>
            </fo:table-cell>
          </fo:table-row>
        -->
          <fo:table-row height="4mm">
            <fo:table-cell font-weight="bold"><fo:block>&#160;NUMBER OF PIECES </fo:block></fo:table-cell>
            <fo:table-cell>
              <fo:block font-weight="bold" font-size="10pt"> &#160;<xsl:value-of select="cs_nopg"/></fo:block>
            </fo:table-cell>
          </fo:table-row>

          <fo:table-row height="2mm">
            <fo:table-cell number-columns-spanned="2"><fo:block>&#160;</fo:block></fo:table-cell>
          </fo:table-row>

        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template name="dest_addr">
    <fo:block font-size="7pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="3mm"/>
        <fo:table-column column-width="91mm"/>
        <fo:table-body>
          <fo:table-row height="39mm">
            <fo:table-cell>
              <fo:table table-layout="fixed">
                <fo:table-column column-width="3mm"/>
                <fo:table-body>
                  <fo:table-row height="2mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center"> </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">C </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">O</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">N</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">S</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">I</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">G</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">N</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">E</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">E</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="1mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center"> </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>

            <fo:table-cell
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
              border-left-width=".0pt" border-left-color="#000000" border-left-style="solid"
              border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
              <fo:table table-layout="fixed">
                <fo:table-column column-width="62mm"/>
                <fo:table-column column-width="28.90mm"/>
                <fo:table-body>
                  <fo:table-row height="5mm" display-align="center" text-align="left">
                    <fo:table-cell number-columns-spanned="2" font-size="7pt" padding-left="5pt" padding-right="0pt" border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block overflow="hidden" wrap-option="no-wrap" height="5mm">TO&#160;(RECIPIENT'S NAME/DEPT)&#160;&#160;&#160;
                        <fo:inline>ATTN : <xsl:value-of select="da_ctnm"/></fo:inline>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row height="25mm">
                    <fo:table-cell  font-size="7pt" padding-left="10pt" padding-top="5pt" number-columns-spanned="2">
                      <xsl:if test="da_cnam">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(da_cnam,''))"/></fo:block>
                      </xsl:if>
                      <xsl:if test="da_adr1">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(da_adr1,''))"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_adr2">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(da_adr2,''))"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_adr3">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(da_adr3,''))"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_adr4">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(da_adr4,''))"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_zpcd">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(da_zpcd,''))"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_cocd">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(da_co_desc,''))"/></fo:block>
                      </xsl:if>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row height="5mm">
                    <fo:table-cell padding-left="5pt"
                      border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                      border-bottom="0pt" border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block font-size="5pt" text-align="left" space-before.optimum="2pt">P.O. BOX ADDRESSES WILL REQUIRE RECIPIENT'S PHONE NUMBER</fo:block>
                      <fo:block text-align="left">
                         PHONE NO.: <fo:inline><xsl:value-of select="da_phon"/></fo:inline>
                      </fo:block>
                      <xsl:if test="da_mobl">
                         <fo:block text-align="left">
                           MOBILE NO.: <fo:inline><xsl:value-of select="da_mobl"/></fo:inline>
                         </fo:block>
                      </xsl:if>   
                    </fo:table-cell>
                    <fo:table-cell padding-left="5pt"
                      border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                      >
                      <fo:block space-before.optimum="2pt" font-size="5pt">UPON DELIVERY NOTIFY</fo:block>
                      <fo:block text-align="left">
                        <!--<xsl:value-of select=""/> -->
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>


  <xsl:template name="sndr_addr">
    <fo:block font-size="7pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="3mm"/>
        <fo:table-column column-width="97mm"/>
        <fo:table-body>
          <fo:table-row height="39mm">
            <fo:table-cell>
              <fo:table table-layout="fixed">
                <fo:table-column column-width="3mm"/>
                <fo:table-body>
                  <fo:table-row height="2mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center"> </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="5mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">S</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="5mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">H</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="5mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">I</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="5mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">P</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="5mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">P</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="5mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">E</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="5mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">R</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="2mm">
                    <fo:table-cell background-color="#000000">
                      <fo:block color="#ffffff" font-weight="bold" text-align="center"></fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>

            <fo:table-cell
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
              border-left-width=".0pt" border-left-color="#000000" border-left-style="solid"
              border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
              <fo:table table-layout="fixed">
                <fo:table-column column-width="48mm"/>
                <fo:table-column column-width="48.90mm"/>
                <fo:table-body>
                  <fo:table-row height="5mm" display-align="center" text-align="left">
                    <fo:table-cell number-columns-spanned="2" font-size="7pt" padding-left="5pt" padding-right="0pt" 
border-bottom-width=".3pt" 
border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block display-align="center">
                        FROM&#160;(YOUR NAME)
                        
&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
&#160;&#160;
                        YOUR PHONE NUMBER &#160;&#160;
                        <xsl:if test="ca_phon">
                         <fo:inline> <xsl:value-of select="ca_phon"/> </fo:inline>
                        </xsl:if>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="25mm">
                    <fo:table-cell  font-size="7pt" padding-left="10pt" padding-top="5pt" number-columns-spanned="2">
                      <xsl:if test="ca_ctnm">
                        <fo:block>ATTN :
                          <!-- For client online -->
                          <xsl:value-of select="java:toUpperCase(concat(ca_ctnm,''))"/>
                          <!-- For client online -->
                          <!-- <xsl:value-of select="cs_clus"/> -->
                        </fo:block>
                      </xsl:if>
                      <xsl:if test="ca_cnam">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(ca_cnam,''))"/></fo:block>
                      </xsl:if>
		                  <xsl:if test="ca_adr1">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(ca_adr1,''))"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_adr2">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(ca_adr2,''))"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_adr3">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(ca_adr3,''))"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_adr4">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(ca_adr4,''))"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_zpcd">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(ca_zpcd,''))"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_cocd">
                        <fo:block><xsl:value-of select="java:toUpperCase(concat(ca_co_desc,''))"/></fo:block>
                      </xsl:if>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row height="5mm">
                    <fo:table-cell padding-left="5pt"
                      border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                      border-bottom="0pt" border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block  text-align="left" font-size="7pt" space-before.optimum="2pt">YOUR REFERENCE INFORMATION</fo:block>
                      <fo:block  text-align="left" space-before.optimum="2pt">
                        <xsl:value-of select="cs_cref"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell padding-left="5pt"
                      border-top-width=".1pt" border-top-color="#000000" border-top-style="solid">
                      <fo:block>&#160;</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template name="job_details_prompt">
    <fo:block font-size="6pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="100mm"/>
        <fo:table-body>
          <fo:table-row height="11mm">
            <fo:table-cell padding-left="2mm" border=".3pt solid #000000">
              <fo:block font-size="5pt" text-align="left" padding-top="2pt">DESCRIPTION OF CONTENTS 4  COPIES OF PROFORMA INVOICE REQUIRED FOR NON-DOCUMENT SHIPMENTS </fo:block>
              <fo:block text-align="left" font-size="4pt">&#160;</fo:block>
              <xsl:if test="contentsType">
                <fo:block text-align="left" font-size="7pt">
                  <xsl:choose>
                    <xsl:when test="java:toUpperCase(concat(contentsType,'')) = 'DOCUMENTS' or java:toUpperCase(concat(contentsType,'')) = 'DOCUMENT'">
                      <xsl:value-of select="contentsType"/>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:value-of select="cs_cont"/>
                    </xsl:otherwise>
                  </xsl:choose>
                </fo:block>
              </xsl:if>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

 <xsl:template name="third_party">
    <fo:block font-size="7pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="94mm"/>
        <fo:table-body>
          <fo:table-row height="11mm">
            <fo:table-cell padding-left="2mm" border=".3pt solid #000000">
              <fo:block font-size="5pt" text-align="left" padding-top="2pt">THIRD PARTY COLLECTION ADDRESS</fo:block>

              <!--  <fo:block font-size="5pt"></fo:block>  -->

            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>


  <xsl:template name="service">
    <fo:block font-size="6pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="3mm"/>
        <fo:table-column column-width="147mm"/>
        <fo:table-body>
          <fo:table-row height="20mm">
            <fo:table-cell background-color="#000000">
              <fo:table table-layout="fixed">
                <fo:table-column column-width="3mm"/>
                <fo:table-body>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">&#160; </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">S</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">E</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">R</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">V</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">I</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">C</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell>
                      <fo:block color="#ffffff" font-weight="bold" text-align="center">E</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>
            <fo:table-cell
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
              border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
              border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">

              <fo:table padding-top="1mm" table-layout="fixed" font-size="8pt">
                <fo:table-column column-width="146mm"/>
                <fo:table-body>               
                <xsl:if test="sl_desc">
                  <fo:table-row>                    
                    <fo:table-cell padding-left="3mm" padding-right="1mm">
                      <fo:block text-align="left" padding-top="1.5pt">
                        SERVICE:
                        <fo:inline><xsl:value-of select="java:toUpperCase(concat(sl_desc,''))"/></fo:inline>
                      </fo:block> 
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="1mm">                    
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                  </fo:table-row>
                </xsl:if>

                <xsl:if test="cs_spin">
                  <fo:table-row>                    
                    <fo:table-cell padding-left="3mm" padding-right="1mm">
                      <fo:block text-align="left" space-before.optimum="1pt">
                        SPECIAL INSTRUCTIONS:
                        <fo:inline><xsl:value-of select="java:toUpperCase(concat(cs_spin,''))"/></fo:inline>
                      </fo:block> 
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="1mm">                    
                    <fo:table-cell><fo:block></fo:block></fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                 <xsl:if test="cs_note">
                  <fo:table-row>                    
                    <fo:table-cell padding-left="3mm" padding-right="1mm">
                      <fo:block text-align="left" space-before.optimum="1pt">
                        NOTES:
                        <fo:inline font-weight="normal" font-size="8pt">
                          <xsl:value-of select="java:toUpperCase(concat(cs_note,''))"/>
                        </fo:inline>
                      </fo:block> 
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>



<xsl:template name="cons_value">
    <fo:block font-size="7pt">
    <fo:table table-layout="fixed">
      <fo:table-column column-width="3mm"/>
      <fo:table-column column-width="42mm"/>
      <fo:table-body>
        <fo:table-row height="20mm">
          <fo:table-cell background-color="#000000">
            <fo:table table-layout="fixed">
              <fo:table-column column-width="3mm"/>
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell>
                    <fo:block color="#ffffff" font-weight="bold" text-align="center">&#160; </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell>
                    <fo:block color="#ffffff" font-weight="bold" text-align="center">V</fo:block>
                  </fo:table-cell>
                </fo:table-row>

                <fo:table-row>
                  <fo:table-cell>
                    <fo:block color="#ffffff" font-weight="bold" text-align="center">A</fo:block>
                  </fo:table-cell>
                </fo:table-row>

                <fo:table-row>
                  <fo:table-cell>
                    <fo:block color="#ffffff" font-weight="bold" text-align="center">L</fo:block>
                  </fo:table-cell>
                </fo:table-row>

                <fo:table-row>
                  <fo:table-cell>
                    <fo:block color="#ffffff" font-weight="bold" text-align="center">U</fo:block>
                  </fo:table-cell>
                </fo:table-row>

                <fo:table-row>
                  <fo:table-cell>
                    <fo:block color="#ffffff" font-weight="bold" text-align="center">E</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:table-cell>
          <fo:table-cell
          border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
          border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
          border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
          border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">

          <fo:table table-layout="fixed">
            <fo:table-column column-width="38mm"/>
            <fo:table-body>
            <fo:table-row height="5mm">
              <fo:table-cell padding-left="5mm" padding-top="1pt">
              <fo:block text-align="left" space-before.optimum="2pt">VALUE FOR CUSTOMS</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="15mm">
              <fo:table-cell padding-left="5mm">
              <fo:block text-align="left" display-align="center"><xsl:value-of select="cs_cval"/></fo:block>
              </fo:table-cell>
            </fo:table-row>
            </fo:table-body>
          </fo:table>
          </fo:table-cell>
        </fo:table-row>
      </fo:table-body>
    </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template name="shiper_sig">
    <fo:block font-size="7pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="54mm"/>
        <fo:table-body>
          <fo:table-row height="24mm">
            <fo:table-cell padding-left="0pt" padding-right="0pt"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid">
              <fo:table table-layout="fixed">
                <fo:table-column column-width="33mm"/>
                <fo:table-column column-width="21mm"/>
                <fo:table-body>
                  <!--<fo:table-row height="1pt">
                    <fo:table-cell number-columns-spanned="2"></fo:table-cell>
                  </fo:table-row>-->
                  <fo:table-row height="5mm" display-align="center">
                    <fo:table-cell
                    padding-left="0pt" padding-right="0pt" number-columns-spanned="2"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    background-color="#dddddd">
                      <fo:block display-align="center" font-size="7pt">&#160;&#160;&#160;SHIPPER SIGNATURE</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="4mm" display-align="center">
                    <fo:table-cell
                    padding-left="0pt" padding-right="0pt" number-columns-spanned="2"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
                      <fo:block text-align="center" display-align="center" font-size="6pt">(AGREEMENT TO CONDITIONS OF CONTRACT)</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row height="8mm">
                    <fo:table-cell number-columns-spanned="2" padding-left="0pt" padding-right="0pt"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
                        <fo:block  display-align="center" font-size="6pt">&#160;</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                   <fo:table-row display-align="center" height="4mm">
                    <fo:table-cell
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    padding-left="2pt">
                      <fo:block font-size="6pt">DATE</fo:block>
                    </fo:table-cell>
                    <fo:table-cell
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    padding-left="2pt">
                      <fo:block display-align="center" font-size="6pt">TIME</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>
<!--|||||||||||||||||||||||||||||||||||||||-->	
<!--  Driver Signature                 -->
<!--|||||||||||||||||||||||||||||||||||||||-->	

  <xsl:template name="driver_sig">
    <fo:block font-size="6pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="54mm"/>
        <fo:table-body>
          <fo:table-row height="24mm">
            <fo:table-cell padding-left="0pt" padding-right="0pt"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid" >
              <fo:table table-layout="fixed">
                <fo:table-column column-width="33mm"/>
                <fo:table-column column-width="21mm"/>
                <fo:table-body>
                  <!--<fo:table-row height="1pt">
                    <fo:table-cell number-columns-spanned="2"></fo:table-cell>
                  </fo:table-row>-->
                  <fo:table-row height="5mm" display-align="center">
                    <fo:table-cell
                    padding-left="0pt" padding-right="0pt" number-columns-spanned="2"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    background-color="#dddddd">
                      <fo:block display-align="center" font-size="7pt">&#160;&#160;&#160;DRIVER SIGNATURE</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row height="12mm">
                    <fo:table-cell number-columns-spanned="2" padding-left="0pt" padding-right="0pt"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
                        <fo:block  display-align="center" font-size="6pt">&#160;</fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                   <fo:table-row height="4mm" display-align="center">
                    <fo:table-cell
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    padding-left="2pt">
                      <fo:block display-align="center" font-size="6pt">DATE</fo:block>
                    </fo:table-cell>
                    <fo:table-cell
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    padding-left="2pt">
                      <fo:block display-align="center" font-size="6pt">TIME</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>
  
  <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<!-- ! Template name   : barcode (Barcode generator)                                      ! -->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<!-- ! Parameters used:                                                                   ! -->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<!-- ! awbn                : number                                                       ! -->
<!-- ! StartSoop value     : true/false                                                   ! -->
<!-- ! humanReadable value : true/false                                                   ! -->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<!-- ! Example                                                                            ! -->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<!-- ! <xsl:call-template name="barcode">                                                 ! -->                                                                               
<!-- !   <xsl:with-param name="awbn">123456</xsl:with-param>                              ! -->
<!-- !   <xsl:with-param name="startStop">true</xsl:with-param>                           ! -->
<!-- !   <xsl:with-param name="humanReadable">true</xsl:with-param>                       ! -->
<!-- ! </xsl:call-template>                                                               ! -->
<!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->

	<xsl:template name="barcode"> 
	<xsl:param name="awbn"/>  
	<xsl:param name="startStop"/>
	<xsl:param name="humanReadable"/>
	<xsl:param name="barcodeHeight"/>
	<xsl:param name="fontSize"/>	
	<fo:block>
		<fo:instream-foreign-object>
			<barcode:barcode xmlns:barcode="http://barcode4j.krysalis.org/ns" message="{$awbn}">
				<barcode:code39>
					<barcode:height><xsl:value-of select="$barcodeHeight"/>mm</barcode:height>
					<barcode:module-width>0.30mm</barcode:module-width>
					 <xsl:if test="$humanReadable != 'true'">
						 <barcode:human-readable>none</barcode:human-readable>
					 </xsl:if>  
					<barcode:human-readable>
						<barcode:display-start-stop><xsl:value-of select="$startStop"/></barcode:display-start-stop>
							<barcode:font-size><xsl:value-of select="$fontSize"/>pt</barcode:font-size>
					</barcode:human-readable>
				</barcode:code39>
			</barcode:barcode>      
		</fo:instream-foreign-object>
	</fo:block>
	</xsl:template>
	
<!--|||||||||||||||||||||||||||||||||||||||-->	
<!--  Delivery consignment                 -->
<!--|||||||||||||||||||||||||||||||||||||||-->	
  <xsl:template name="deliver_cons">
    <fo:block font-size="6pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="85mm"/>
        <fo:table-body>
          <fo:table-row height="24mm">
            <fo:table-cell>
              <fo:table table-layout="fixed">
                <fo:table-column column-width="51mm"/>
                <fo:table-column column-width="33.75mm"/>
                <fo:table-body>
                  <!--
				  <fo:table-row height="1pt">
                    <fo:table-cell number-columns-spanned="2"
                    padding-left="0pt" padding-right="0pt"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid">
                    </fo:table-cell>
                  </fo:table-row>-->
                  <fo:table-row height="5mm" display-align="center">
                    <fo:table-cell number-columns-spanned="2"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
					border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                    padding-left="3pt" background-color="#dddddd">
                      <fo:block display-align="center" font-size="7pt">TO BE COMPLETED ON DELIVERY BY THE CONSIGNEE</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row font-weight="bold" height="12mm">
                    <fo:table-cell number-columns-spanned="2"
                      padding-left="0pt" padding-right="0pt"
                      border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                      border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                      border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                      border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
                      <fo:block  display-align="center" font-size="5pt">&#160;</fo:block>
                        <fo:block  display-align="center" font-size="8pt">&#160;&#160;&#160;SIGNATURE</fo:block>
                        <fo:block  display-align="center" font-size="5pt">&#160;</fo:block>
                        <fo:block  display-align="center" font-size="5pt">&#160;</fo:block>
                        <fo:block  display-align="center" font-size="8pt">&#160;&#160;&#160;PRINT NAME</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                   <fo:table-row height="4mm" display-align="center">
                    <fo:table-cell
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
                      <fo:block display-align="center" font-size="6pt">&#160;&#160;DATE</fo:block>
                    </fo:table-cell>
                    <fo:table-cell
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid">
                      <fo:block display-align="center" font-size="6pt">&#160;&#160;TIME</fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </fo:table-body>
              </fo:table>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>


 <xsl:template name="botton">
   <fo:block text-align="center" display-align="center" height="6mm" font-size="7pt"> &#160;&#160;&#160; THIS IS A NON-NEGOTIABLE AWB ISSUED 
SUBJECT 
TO THE COMPANY'S STANDARD TRADING CONDITIONS. A COPY OF WHICH IS AVAILABLE ON REQUEST. </fo:block>
 </xsl:template>

</xsl:stylesheet>
