<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" 
exclude-result-prefixes="fo" xmlns:java="com.metafour.netcourier.util.FopHelper" extension-element-prefixes="java">
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
<!--!    File Name    : tcc_hawb_uni_template                      !-->
<!--!    Description  : tcc template                               !-->
<!--!    Author       : Mehedi                                     !-->
<!--!    Date         : 07-Jan-2010                                !-->
<!--!    Copyright    : Copyright (c) M.F. Systems, 2010           !-->
<!--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element:             -->
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
      <fo:page-sequence master-reference="A4" font-family="sarif">
       <fo:flow flow-name="xsl-region-body">
          <fo:block-container height="146mm" width="21cm" left="0mm" top="0mm" position="absolute">
          <xsl:apply-templates select="hawb"/>
        </fo:block-container>
        <fo:block-container height="145mm" width="21cm" left="0mm" top="146.75mm" position="absolute">
          <xsl:apply-templates select="hawb"/>
        </fo:block-container>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>


  <xsl:template match="hawb">
  
     <fo:block-container height="23mm" width="128mm" left="0mm" top="0mm" position="absolute">
      <xsl:call-template name="logo"/>
    </fo:block-container>

    <fo:block-container  font-size="5pt" height="8mm" width="100mm" left="0mm" top="25mm" position="absolute">
      <xsl:call-template name="title"/>
    </fo:block-container>

    <fo:block-container height="39mm" width="67mm" left="130mm" top="0.05mm" position="absolute">
      <xsl:call-template name="awb_info"/>
    </fo:block-container>

    <fo:block-container height="39mm" width="100mm" left="0mm" top="39mm" position="absolute">
       <xsl:call-template name="sndr_addr"/>
    </fo:block-container>
	
    <fo:block-container height="39mm" width="94mm" left="103mm" top="39mm" position="absolute">
      <xsl:call-template name="dest_addr"/>
    </fo:block-container>

    <fo:block-container height="11mm" width="100mm" left="0mm" top="79mm" position="absolute">
       <xsl:call-template name="job_details_prompt"/>
    </fo:block-container>
	
    <fo:block-container height="11mm" width="94mm" left="103mm" top="79mm" position="absolute">
       <xsl:call-template name="third_party"/>
    </fo:block-container>
<!-- -->
    <fo:block-container height="20mm" width="150mm" left="0mm" top="91mm" position="absolute">
       <xsl:call-template name="service"/>
    </fo:block-container>

    <fo:block-container height="20mm" width="45mm" left="152mm" top="91mm" position="absolute">
      <xsl:call-template name="cons_value"/>
    </fo:block-container>

    <fo:block-container height="24mm" width="54mm" left="0mm" top="112mm" position="absolute">
      <xsl:call-template name="shiper_sig"/>
    </fo:block-container>
    <fo:block-container height="23mm" width="54mm" left="56mm" top="112mm" position="absolute">
      <xsl:call-template name="driver_sig"/>
    </fo:block-container>

     <fo:block-container height="23mm" width="85mm" left="112mm" top="112mm" position="absolute">
      <xsl:call-template name="deliver_cons"/>
    </fo:block-container>

    <fo:block-container height="6mm" width="194mm" left="0mm" top="135mm" position="absolute">
      <xsl:call-template name="botton"/>
    </fo:block-container>
  </xsl:template>

  <!--<xsl:template name="logo">
    <fo:block>
       <xsl:variable name="imagepath" select="concat('file:',image_path,'tcc_logo_pdf.jpg')"/>
      <fo:external-graphic border="0" src="{$imagepath}"/>
    </fo:block>
  </xsl:template>-->
  
  <xsl:template name="logo">
    <fo:block>
      <xsl:variable name="imagepath" select="concat('file:',/netc/hawb/image_path,'/tcc_logo_pdf.jpg')"/>
      <fo:external-graphic padding="0" margin="0" space-start="0" space-end="0" pause-before="0" pause-after="0" content-height="23mm" content-width="128mm" scaling="non-uniform" src="{$imagepath}"/>
    </fo:block>
  </xsl:template>

  
  <xsl:template name="title">
    <fo:block>
      <xsl:if test="cr_adr1 != ''">
        <xsl:value-of select="cr_adr1"/>
      </xsl:if>
      <xsl:if test="cr_adr2 != ''">
        , <xsl:value-of select="cr_adr2"/>
      </xsl:if>
      <xsl:if test="cr_adr3 != ''">
        , <xsl:value-of select="cr_adr3"/>
      </xsl:if>      
      <xsl:if test="cr_adr4 != ''">
        , <xsl:value-of select="cr_adr4"/>
      </xsl:if>
      <xsl:if test="cr_zpcd != ''">
        , <xsl:value-of select="cr_zpcd"/>
      </xsl:if>
    </fo:block>
    <fo:block>
      <xsl:if test="cr_phon != ''">
        Tel: <xsl:value-of select="cr_phon"/>
      </xsl:if>
      &#160;&#160;&#160;&#160;
      <xsl:if test="cr_faxn != ''">
        Fax: <xsl:value-of select="cr_faxn"/>
      </xsl:if>
    </fo:block>
  </xsl:template>

  <xsl:template name="awb_info">
    <fo:block font-size="7pt" width="67mm">
      <fo:table border="solid .3pt #000000" table-layout="fixed" width="67mm" line-height="90%">
        <fo:table-column column-width="37mm"/>
        <fo:table-column column-width="30mm"/>
        <fo:table-body>
          <fo:table-row background-color="#D5E2E8" height="6mm" display-align="center">
            <fo:table-cell
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
              border-left-width=".3pt" border-left-color="#000000" border-left-style="solid">
              <fo:block font-size="8pt" font-weight="bold">&#160;AIRWAY BILL NUMBER</fo:block>
            </fo:table-cell>
            <fo:table-cell
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
              border-right-width=".3pt" border-right-color="#000000" border-right-style="solid">
              <fo:block text-align="right" font-size="10pt" font-weight="bold"><xsl:value-of select="cs_awbn"/>&#160;</fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row height="20mm">
            <fo:table-cell number-columns-spanned="2" padding-right="2pt" padding-top="2pt"
              border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid">
              <fo:block text-align="center" padding-top="1.5pt">                
						<xsl:call-template name="barcode">
							<xsl:with-param name="awbn"><xsl:value-of select="/netc/hawb/cs_awbn"/></xsl:with-param>
							<xsl:with-param name="startStop">false</xsl:with-param>
							<xsl:with-param name="humanReadable">true</xsl:with-param>
							<xsl:with-param name="barcodeHeight">15</xsl:with-param>
						</xsl:call-template>
					</fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row>
            <fo:table-cell><fo:block font-weight="bold" padding-bottom="2px" padding-top="2px">&#160;DATE </fo:block></fo:table-cell>
            <fo:table-cell>
              <fo:block font-weight="bold" padding-bottom="2px" padding-top="2px"> &#160;<xsl:value-of select="cs_bkdt"/></fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row>
            <fo:table-cell font-weight="bold" padding-bottom="2px"><fo:block>&#160;WEIGHT </fo:block></fo:table-cell>
            <fo:table-cell>
              <fo:block font-weight="bold" padding-bottom="2px"> &#160;<xsl:value-of select="cs_twgt"/>&#160;kgs </fo:block>
            </fo:table-cell>
          </fo:table-row>
          <fo:table-row>
            <fo:table-cell font-weight="bold" padding-bottom="2px"><fo:block>&#160;NUMBER OF PIECES </fo:block></fo:table-cell>
            <fo:table-cell>
              <fo:block font-weight="bold" padding-bottom="2px"> &#160;<xsl:value-of select="cs_nopg"/></fo:block>
            </fo:table-cell>
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
          <fo:table-row height="0mm">
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
                <fo:table-column column-width="58mm"/>
                <fo:table-column column-width="32.90mm"/>
                <fo:table-body>
                  <fo:table-row height="5mm" display-align="center" text-align="left">
                    <fo:table-cell number-columns-spanned="2" font-size="6pt" padding-left="2pt" padding-right="0pt" 
border-bottom-width=".3pt" 
border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block overflow="hidden" wrap-option="no-wrap" height="5mm">TO&#160;(RECIPIENT'S NAME/DEPT)&#160;&#160;&#160;
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row height="24mm">
                    <fo:table-cell  font-size="7pt" padding-left="10pt" padding-top="2pt" number-columns-spanned="2">
                      <fo:block-container height="24mm" width="86mm" line-height="110%">  
                      <xsl:if test="da_cnam">
                        <fo:block><xsl:value-of select="da_cnam"/></fo:block>
                      </xsl:if>
                      <xsl:if test="da_adr1">
                        <fo:block><xsl:value-of select="da_adr1"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_adr2">
                        <fo:block><xsl:value-of select="da_adr2"/></fo:block>
                      </xsl:if>
                      <xsl:if test="da_adr3">
                        <fo:block><xsl:value-of select="da_adr3"/></fo:block>
                      </xsl:if>
                      <xsl:if test="da_adr4">
                        <fo:block><xsl:value-of select="da_adr4"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_zpcd">
                        <fo:block><xsl:value-of select="da_zpcd"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_adr5">
                        <fo:block><xsl:value-of select="da_adr5"/></fo:block>
                      </xsl:if>
                       <xsl:if test="da_cocd">
                        <fo:block><xsl:value-of select="da_co_desc"/></fo:block>
                      </xsl:if>
                      </fo:block-container>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row font-size="6pt" height="8.9mm">
                    <fo:table-cell line-height="85%" padding-left="5pt"
                      border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
					  border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                      border-bottom="0pt" border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block font-size="4.5pt" text-align="left" padding-top="2pt">P.O. BOX ADDRESSES WILL REQUIRE RECIPIENT'S 
PHONE 
NUMBER</fo:block>
                      <fo:block font-size="3pt">&#160; </fo:block>
                      <fo:block text-align="left">PHONE/FAX NO.: <fo:inline font-weight="bold">
                        <xsl:value-of select="da_phon"/></fo:inline>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell line-height="85%" font-size="5pt" padding-left="2pt"
                      border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
                      
                      border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                      >
                      <fo:block padding-top="2pt">UPON DELIVERY NOTIFY</fo:block>
                      <fo:block text-align="left" padding-top="1pt">
                         <xsl:value-of select="da_ctnm"/>
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
          <fo:table-row height="0mm">
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
                    <fo:table-cell font-size="6pt" padding-left="2pt" border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block overflow="hidden" wrap-option="no-wrap">
                        FROM: <fo:inline><xsl:value-of select="ca_ctnm"/> </fo:inline>
                      </fo:block>
</fo:table-cell>
<fo:table-cell font-size="6pt" padding-left="2pt" border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block overflow="hidden" wrap-option="no-wrap">
                        PHONE NUMBER: <fo:inline><xsl:value-of select="ca_phon"/> </fo:inline>
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
    
                  <fo:table-row height="24mm">
                    <fo:table-cell  font-size="7pt" padding-left="10pt" padding-top="5pt" number-columns-spanned="2">
                     <fo:block-container height="24mm" width="93mm" line-height="110%">
                      <xsl:if test="ca_cnam">
                        <fo:block><xsl:value-of select="ca_cnam"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_adr1">
                        <fo:block><xsl:value-of select="ca_adr1"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_adr2">
                        <fo:block><xsl:value-of select="ca_adr2"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_adr3">
                        <fo:block><xsl:value-of select="ca_adr3"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_adr4">
                        <fo:block><xsl:value-of select="ca_adr4"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_zpcd">
                        <fo:block><xsl:value-of select="ca_zpcd"/></fo:block>
                      </xsl:if>
                      <xsl:if test="ca_cocd">
                        <fo:block><xsl:value-of select="ca_co_desc"/></fo:block>
                      </xsl:if>
                      </fo:block-container>
                    </fo:table-cell>
                  </fo:table-row>

                  <fo:table-row height="7.9mm">
                    <fo:table-cell  line-height="85%" padding-left="5pt"
                      border-top-width=".3pt" border-top-color="#000000" border-top-style="solid"
					  border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                      border-bottom="0pt" border-bottom-color="#000000" border-bottom-style="solid">
                      <fo:block  text-align="left" font-size="7pt" padding-top="2pt">YOUR REFERENCE INFORMATION</fo:block>
                      <fo:block  text-align="left" padding-top="2pt">
                        <xsl:value-of select="cs_cref"/>
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell  line-height="85%" background-color="#D5E2E8" padding-left="5pt"
                      border-top-width=".1pt" border-top-color="#000000" border-top-style="solid"
                      
                      border-left-width=".1pt" border-left-color="#000000" border-left-style="solid"
                      >
                      <fo:block padding-top="2pt" font-size="7pt">ACCOUNT NUMBER</fo:block>
                      <fo:block text-align="left" font-size="7pt" padding-top="2pt">
                        <xsl:value-of select="ac_number"/>
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

  <xsl:template name="job_details_prompt">
    <fo:block font-size="6pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="100mm"/>
        <fo:table-body>
          <fo:table-row height="11mm">
            <fo:table-cell padding-left="2mm" border=".3pt solid #000000">
              <fo:block font-size="5pt" text-align="left" padding-top="2pt">DESCRIPTION OF CONTENTS 4  COPIES OF PROFORMA INVOICE REQUIRED FOR 
NON-DOCUMENT SHIPMENTS </fo:block>
              <fo:block text-align="left" font-size="4pt">&#160;</fo:block>
              <xsl:choose>
                <xsl:when test="contentsType='Documents'">
                  <fo:block text-align="left" font-size="7pt">
                    <xsl:value-of select="contentsType"/>
                  </fo:block>
                </xsl:when>
                <xsl:otherwise>
                  <fo:block text-align="left" font-size="7pt">
                  <xsl:value-of select="cs_cont"/>
                </fo:block>
                </xsl:otherwise>
              </xsl:choose>
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
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>


  <xsl:template name="service">
    <fo:block font-size="5pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="3mm"/>
        <fo:table-column column-width="147mm"/>
        <fo:table-body>
          <fo:table-row height="19mm">
            <fo:table-cell background-color="#000000">
			<fo:block>
              <fo:table table-layout="fixed">
                <fo:table-column column-width="3mm"/>
                <fo:table-body>
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
			  </fo:block>
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
								<fo:block text-align="left" space-before.optimum="1pt">
								SERVICE INSTRUCTIONS :
									<fo:inline><xsl:value-of select="sl_desc"/></fo:inline>
								</fo:block> 
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="1mm">                    
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>

					<xsl:if test="cs_spin">
						<fo:table-row>                    
							<fo:table-cell padding-left="3mm" padding-right="1mm">
								<fo:block text-align="left" space-before.optimum="1pt">
									SPECIAL INSTRUCTIONS:<fo:inline><xsl:value-of select="cs_spin"/></fo:inline>
								</fo:block> 
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="1mm">                    
							<fo:table-cell>
								<fo:block></fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>
					<xsl:if test="cs_note">
						<fo:table-row>                    
							<fo:table-cell padding-left="3mm" padding-right="1mm">
								<fo:block text-align="left" space-before.optimum="1pt">
									NOTES:
									<fo:inline font-weight="normal" font-size="8pt">
										<xsl:value-of select="cs_note"/>
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
    <fo:block font-size="6pt">
    <fo:table table-layout="fixed">
      <fo:table-column column-width="3mm"/>
      <fo:table-column column-width="42mm"/>
      <fo:table-body>
        <fo:table-row height="19mm">
          <fo:table-cell background-color="#000000">
            <fo:table table-layout="fixed">
              <fo:table-column column-width="3mm"/>
              <fo:table-body>
                <fo:table-row>
                    <fo:table-cell font-size="3pt">
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
              <fo:table-cell padding-left="5mm">
              <fo:block text-align="left" padding-top="2pt">VALUE FOR CUSTOMS</fo:block>
              </fo:table-cell>
            </fo:table-row>
            <fo:table-row height="14mm">
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
			  <fo:block>
              <fo:table table-layout="fixed">
                <fo:table-column column-width="33mm"/>
                <fo:table-column column-width="21mm"/>
                <fo:table-body>
               <!--   <fo:table-row height="1pt">
                    <fo:table-cell number-columns-spanned="2"><fo:block>&#160;</fo:block></fo:table-cell>
                  </fo:table-row> -->
                  <fo:table-row height="5mm" display-align="center">
                    <fo:table-cell
                    padding-left="0pt" padding-right="0pt" number-columns-spanned="2"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    background-color="#D5E2E8">
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
			  </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template name="driver_sig">
    <fo:block font-size="6pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="54mm"/>
        <fo:table-body>
          <fo:table-row height="24mm">
            <fo:table-cell padding-left="0pt" padding-right="0pt"
              border-top-width=".3pt" border-top-color="#000000" border-top-style="solid" >
			  <fo:block>
              <fo:table table-layout="fixed">
                <fo:table-column column-width="33mm"/>
                <fo:table-column column-width="21mm"/>
                <fo:table-body>
              <!--    <fo:table-row height="1pt">
                    <fo:table-cell number-columns-spanned="2"><fo:block>&#160;</fo:block></fo:table-cell>
                  </fo:table-row> -->
                  <fo:table-row height="5mm" display-align="center">
                    <fo:table-cell
                    padding-left="0pt" padding-right="0pt" number-columns-spanned="2"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    background-color="#D5E2E8">
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
			  </fo:block>
            </fo:table-cell>
          </fo:table-row>
        </fo:table-body>
      </fo:table>
    </fo:block>
  </xsl:template>

  <xsl:template name="deliver_cons">
    <fo:block font-size="6pt">
      <fo:table table-layout="fixed">
        <fo:table-column column-width="85mm"/>
        <fo:table-body>
          <fo:table-row height="24mm">
            <fo:table-cell>
			<fo:block>
              <fo:table table-layout="fixed">
                <fo:table-column column-width="51mm"/>
                <fo:table-column column-width="33.75mm"/>
                <fo:table-body>
             <!--     <fo:table-row height="1pt">
                    <fo:table-cell number-columns-spanned="2"
                    padding-left="0pt" padding-right="0pt"
                    border-top-width=".3pt" border-top-color="#000000" border-top-style="solid">
					<fo:block>&#160;</fo:block>
                    </fo:table-cell>
                  </fo:table-row> -->
                  <fo:table-row height="5mm" display-align="center">
                    <fo:table-cell number-columns-spanned="2"
                    border-bottom-width=".3pt" border-bottom-color="#000000" border-bottom-style="solid"
                    border-left-width=".3pt" border-left-color="#000000" border-left-style="solid"
                    border-right-width=".3pt" border-right-color="#000000" border-right-style="solid"
                    padding-left="3pt" background-color="#D5E2E8">
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
                    <!--    <fo:block  display-align="center" font-size="5pt">&#160;</fo:block> -->
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
			  </fo:block>
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
	<fo:block>
		<fo:instream-foreign-object>
			<barcode:barcode xmlns:barcode="http://barcode4j.krysalis.org/ns" message="{$awbn}">
				<barcode:code39>
					<barcode:height><xsl:value-of select="$barcodeHeight"/>mm</barcode:height>
					<barcode:module-width>0.32mm</barcode:module-width>
					 <xsl:if test="$humanReadable != 'true'">
						 <barcode:human-readable>none</barcode:human-readable>
					 </xsl:if>  
					<barcode:human-readable>
						<barcode:display-start-stop><xsl:value-of select="$startStop"/></barcode:display-start-stop>
            <font-size>10pt</font-size>
					</barcode:human-readable>
				</barcode:code39>
			</barcode:barcode>      
		</fo:instream-foreign-object>
	</fo:block>
	</xsl:template>


 <xsl:template name="botton">
   <fo:block text-align="center" display-align="center" height="6mm" font-size="7pt"> &#160;&#160;&#160; THIS IS A NON-NEGOTIABLE AWB ISSUED 
SUBJECT 
TO THE COMPANY'S STANDARD TRADING CONDITIONS. A COPY OF WHICH IS AVAILABLE ON REQUEST. </fo:block>
 </xsl:template>

</xsl:stylesheet>
