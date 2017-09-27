<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" 
exclude-result-prefixes="fo" xmlns:java="com.metafour.netcourier.util.FopHelper" extension-element-prefixes="java">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::-->
  <!--:                                                                   :-->
  <!--:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::-->

  <xsl:template match="netc">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="hawb" page-height="27.9cm" page-width="21cm" margin-top="5mm" margin-bottom="5mm" margin-left="5mm" margin-right="5mm">
		
          <fo:region-body margin-left="0mm" margin-right="0mm" margin-top="32.8mm" margin-bottom="70mm"/>
		  <fo:region-before region-name="header-first" extent="32.8mm"/>
		  <fo:region-after region-name="footer-first" extent="0mm"/>
		 
        </fo:simple-page-master>
		<fo:simple-page-master master-name="rest-page" page-height="27.9cm" page-width="21cm" margin-top="5mm" margin-bottom="5mm" margin-left="5mm" margin-right="5mm">
		
          <fo:region-body margin-left="0mm" margin-right="0mm" margin-top="32.8mm" margin-bottom="70mm"/>
		  <fo:region-before region-name="header-rest" extent="32.8mm"/>
		  <fo:region-after region-name="footer-rest" extent="0mm"/>
			
        </fo:simple-page-master>
        <fo:page-sequence-master master-name="document">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference page-position="first" master-reference="hawb"/>
            <fo:conditional-page-master-reference page-position="rest" master-reference="rest-page"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
      </fo:layout-master-set>
      
      <xsl:apply-templates select="hawb"/>
    </fo:root>
  </xsl:template>

  <xsl:template match="hawb">
      <fo:page-sequence master-reference="document">
        <xsl:variable name="pageid" select="generate-id()" />
        <!-- page header -->
        <fo:static-content flow-name="header-first">
          <fo:block-container height="38mm" width="150mm" left="0" top="1mm" position="absolute">
            <xsl:call-template name="header_title"/>
          </fo:block-container>
           <fo:block-container height="15mm" width="200mm" left="0mm" top="26mm" position="absolute" >
            <xsl:call-template name="page_title"/>
          </fo:block-container>
			<fo:block-container height="7mm" width="100mm" left="180mm" top="268mm" position="absolute">
            <fo:block font-size="7pt">Page &#160;<fo:page-number/> of
				<fo:page-number-citation ref-id="last-page"/>    
			</fo:block>
          </fo:block-container>
         <!--<fo:block-container height="70mm" width="200mm" left="0mm" top="190mm" position="absolute">
            <xsl:call-template name="footer"/>
          </fo:block-container>
          <fo:block-container height="38mm" width="150mm" left="0" top="275mm" position="absolute">
            <xsl:call-template name="footer_title"/>
          </fo:block-container>
          <fo:block-container height="7mm" width="100mm" left="180mm" top="280mm" position="absolute">
            <fo:block font-size="7pt">Page &#160;<fo:page-number/> of
				<fo:page-number-citation ref-id="last-page"/>    
			</fo:block>
          </fo:block-container>-->
        </fo:static-content>

		<fo:static-content flow-name="header-rest">
			 <fo:block-container height="38mm" width="150mm" left="0" top="1mm" position="absolute">
            <xsl:call-template name="header_title"/>
          </fo:block-container>
           <fo:block-container height="15mm" width="200mm" left="0mm" top="26mm" position="absolute" >
            <xsl:call-template name="page_title"/>
          </fo:block-container>
		<fo:block-container height="7mm" width="100mm" left="180mm" top="268mm" position="absolute">
            <fo:block font-size="7pt">Page &#160;<fo:page-number/> of
				<fo:page-number-citation ref-id="last-page"/>    
			</fo:block>
          </fo:block-container>	
		</fo:static-content>

		<fo:flow flow-name="xsl-region-body">
			<fo:block font-size="9pt">
            <fo:table table-layout="fixed">
              <fo:table-column column-width="200mm"/>
              <fo:table-body >
			
				  
				  <fo:table-row>
				  	<fo:table-cell >	
						<fo:block  ><xsl:call-template name="main_body"/></fo:block>	
					</fo:table-cell>
				</fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>

          <xsl:choose>
              <xsl:when test="position() = last()">
                <fo:block-container height="57mm" width="200mm" left="0mm" top="16cm" position="absolute">
            <xsl:call-template name="footer"/>
          </fo:block-container>
          <fo:block-container height="38mm" width="150mm" left="0" top="222mm" position="absolute">
            <xsl:call-template name="footer_title"/>
          </fo:block-container>
          
              </xsl:when>
			  
              <xsl:otherwise>
                <fo:block-container height="10mm" width="20cm" left="0mm" top="18mm" position="absolute">
                  &#160;
                </fo:block-container>
              </xsl:otherwise>
            </xsl:choose>

			<fo:block id="last-page">
		</fo:block>
		</fo:flow>
	</fo:page-sequence>
   </xsl:template>

	
	<xsl:template name="header_title">
   <fo:block font-size="10pt" text-align="left" >
			<fo:table table-layout="fixed" width="200mm">
				<fo:table-column column-width="160mm"/>
				<fo:table-column column-width="40mm"/>

						<fo:table-body>
						<fo:table-row>
						<fo:table-cell padding-left="2pt" padding-top="3pt" padding-bottom="3pt"> 
						  <fo:block font-size="11pt" space-before="2pt" space-after="2pt">
					      <xsl:if test="/netc/hawb/ca_adr1 != ''"><xsl:value-of select="/netc/hawb/ca_adr1"/></xsl:if><xsl:if test="/netc/hawb/ca_adr2 != ''">, <xsl:value-of select="/netc/hawb/ca_adr2"/></xsl:if><xsl:if test="/netc/hawb/ca_adr3 != ''">, <xsl:value-of select="/netc/hawb/ca_adr3"/></xsl:if><xsl:if test="/netc/hawb/ca_adr4 != ''"><xsl:value-of select="/netc/hawb/ca_adr4"/></xsl:if><xsl:if test="/netc/hawb/ca_zpcd != ''">, <xsl:value-of select="/netc/hawb/ca_zpcd"/></xsl:if>
					    </fo:block>  
						<fo:block font-size="13pt" space-before="4pt" space-after="2pt" font-weight="bold">
					      Telephone: <xsl:value-of select="/netc/hawb/ca_phon"/> 
						</fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block>
						      <xsl:variable name="imagepath" select="concat('file:',/netc/hawb/image_path,'/metafour_logo.jpg')"/>
						      <fo:external-graphic padding="0" margin="0" space-start="0" space-end="0" pause-before="0" pause-after="0" content-height="21.2mm" content-width="21.5mm" scaling="non-uniform" src="{$imagepath}"/>
						    </fo:block>
						</fo:table-cell>
						
					  </fo:table-row>
					
				
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>


  <!-- ================================= -->
  <!--           footer_title                 -->
  <!-- ================================= -->
  <xsl:template name="footer_title">
   <fo:block font-size="11pt" text-align="left" >
			<fo:table table-layout="fixed" width="200mm">
				<fo:table-column column-width="10mm"/>
				<fo:table-column column-width="30mm"/>
				<fo:table-column column-width="130mm"/>
				<fo:table-column column-width="20mm"/>

						<fo:table-body>
						<fo:table-row>
							<fo:table-cell  font-weight="bold" padding-top="3pt" padding-bottom="3pt"> 
						  <fo:block font-size="10pt" space-before="2pt" space-after="2pt">
					      &#160;
					    </fo:block>  
					
						</fo:table-cell>
						<fo:table-cell >
							<fo:block padding-left="10pt">
						      <xsl:variable name="imagepath" select="concat('file:',/netc/hawb/image_path,'/metafour_logo.jpg')"/>
						      <fo:external-graphic padding="0" margin="0" space-start="0" space-end="0" pause-before="0" pause-after="0" content-height="21.2mm" content-width="21.5mm" scaling="non-uniform" src="{$imagepath}"/>
							</fo:block>
						</fo:table-cell>

						<fo:table-cell padding-top="3pt" padding-bottom="3pt"> 
						  <fo:block font-size="11pt" space-before="2pt" space-after="2pt">
					      <xsl:value-of select="/netc/hawb/cr_desc"/>,<xsl:value-of select="/netc/hawb/cr_adr1"/>, <xsl:value-of select="/netc/hawb/cr_adr2"/>, <xsl:value-of select="/netc/hawb/cr_adr3"/>, <xsl:value-of select="/netc/hawb/cr_adr4"/>, <xsl:value-of select="/netc/hawb/cr_zpcd"/>
					    </fo:block>  
					
						</fo:table-cell>
						<fo:table-cell  font-weight="bold" padding-top="3pt" padding-bottom="3pt"> 
						  <fo:block font-size="10pt" space-before="2pt" space-after="2pt">
					      &#160;
					    </fo:block>  
					
						</fo:table-cell>
					  </fo:table-row>
					
				
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

  <!-- ================================= -->
  <!--           Footer           -->
  <!-- ================================= -->
  <xsl:template name="footer">
	<fo:block font-size="10.5pt">
		<fo:table table-layout="fixed" border="1px solid #000000">
           <fo:table-column column-width="203mm"/>
            <fo:table-body>
				<fo:table-row height="10mm" width="203mm" padding-top="7pt">
					<fo:table-cell padding-left="3pt">
						   <fo:block>For and on behalf of the above named company, I hereby certify that the information on this invoice is true and correct</fo:block>
						   	<fo:block>and that the contents of this shipment are as stated above</fo:block>
					</fo:table-cell>
				</fo:table-row>
				 <fo:table-row>
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="95mm" />
							  <fo:table-column column-width="105mm" />
							 <fo:table-body>
								<fo:table-row font-family="sans-serif" font-weight="normal" font-size="11pt" >
								  <fo:table-cell padding-left="3pt">
										 <fo:block padding-top="2pt">Signature: ______________________________</fo:block> 
										</fo:table-cell>              
								  <fo:table-cell font-size="11pt">
										 <fo:block padding-top="2pt" >Print Name:&#160;System</fo:block> 
										</fo:table-cell>
								  
								</fo:table-row>
								 </fo:table-body>
								</fo:table>
						  </fo:block>
                  </fo:table-cell>
                       </fo:table-row>

                      <fo:table-row>
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="95mm" />
							  <fo:table-column column-width="105mm" />
							 <fo:table-body>
								<fo:table-row font-family="sans-serif" font-weight="normal" font-size="12pt" >
								  <fo:table-cell padding-left="3pt">
										 <fo:block padding-top="2pt">&#160;</fo:block> 
										</fo:table-cell>              
								  <fo:table-cell>
										 <fo:block padding-top="2pt" >&#160;</fo:block> 
										</fo:table-cell>
								  
								</fo:table-row>
								 </fo:table-body>
								</fo:table>
						  </fo:block>
                  </fo:table-cell>
                       </fo:table-row>

                       <fo:table-row>
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="12pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="95mm" />
							  <fo:table-column column-width="105mm" />
							 <fo:table-body>
								<fo:table-row font-family="sans-serif" font-weight="normal" font-size="11pt" >
								  <fo:table-cell padding-left="3pt">
										 <fo:block padding-top="2pt">Date:&#160;&#160;&#160;&#160;
                                           <xsl:call-template name="formatdate">
												<xsl:with-param name="datestr" select="/netc/hawb/cs_bkdt"/>
											</xsl:call-template>
											
										 </fo:block> 
										</fo:table-cell>              
								  <fo:table-cell font-size="11pt">
										 <fo:block padding-top="2pt" >Position in Company:&#160;System</fo:block> 
										</fo:table-cell>
								  
								</fo:table-row>
								 </fo:table-body>
								</fo:table>
						  </fo:block>
                  </fo:table-cell>
                       </fo:table-row>
                     

                       <fo:table-row width="203mm" padding-top="7pt" >
					<fo:table-cell padding-left="3pt">
						    <fo:block padding-top="2pt" >&#160;</fo:block> 
						   <fo:block text-decoration="underline" font-weight="bold">DECLARATION</fo:block>
						   	<fo:block font-family="italic" font-size="12pt">The exporter of the product covered by this document declares that except where otherwise clearly indicated these</fo:block>
						   	<fo:block font-family="italic" font-size="12pt">products are of EU preferential origin</fo:block>
						   	<fo:block padding-top="2pt" >&#160;</fo:block> 
						   	<fo:block padding-top="2pt" >&#160;</fo:block> 
					</fo:table-cell>
				</fo:table-row>

			
			</fo:table-body>
		</fo:table>
    </fo:block>
  </xsl:template>  
  
  
   <!-- ================================= -->
  <!-- page_summary           -->
  <!-- ================================= -->
 <xsl:template name="page_title">
		<fo:block font-size="10pt" text-align="left" >
			<fo:table table-layout="fixed" width="200mm">
				<fo:table-column column-width="45mm"/>
				<fo:table-column column-width="10mm"/>
				<fo:table-column column-width="45mm"/>
				<fo:table-column column-width="45mm"/>
				<fo:table-column column-width="10mm"/>
				<fo:table-column column-width="45mm"/>
						<fo:table-body>
						<fo:table-row>
						<fo:table-cell padding-left="2pt" font-weight="bold" padding-top="3pt" padding-bottom="3pt" border="1px solid #000000"> 
						  <fo:block text-align="left">Commercial Invoice</fo:block> 
						</fo:table-cell>
						<fo:table-cell padding-left="1pt" padding-top="3pt" padding-bottom="3pt" border="1px solid #000000">  
						  <fo:block>&#160;</fo:block> 
						</fo:table-cell>
						<fo:table-cell padding-left="1pt" padding-top="3pt" padding-bottom="3pt">
						  <fo:block text-align="center">Please tick as appropriate</fo:block> 
						</fo:table-cell>
						<fo:table-cell padding-left="2pt" font-weight="bold" padding-top="3pt" padding-bottom="3pt" border="1px solid #000000">
						  <fo:block text-align="left">Pro-forma Invoice</fo:block> 
						</fo:table-cell>
						<fo:table-cell padding-left="2pt" padding-top="3pt" padding-bottom="3pt" border="1px solid #000000">  
						  <fo:block>&#160;</fo:block> 
						</fo:table-cell>
						  <fo:table-cell padding-left="2pt" padding-top="3pt" padding-bottom="3pt">  
						  <fo:block>&#160;</fo:block> 
						</fo:table-cell>
					  </fo:table-row>
					
				
				</fo:table-body>
			</fo:table>
		</fo:block>
</xsl:template>   
   <!-- ================================= -->
  <!--           main_body           -->
  <!-- ================================= -->
  <xsl:template name="main_body">
		<fo:block font-size="10pt" text-align="left">
			<fo:table table-layout="fixed" width="200mm">
				<fo:table-column column-width="35mm"/>
				<fo:table-column column-width="65mm"/>
				<fo:table-column column-width="54mm"/>
				<fo:table-column column-width="49mm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Date of Invoice</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="/netc/hawb/cs_bkdt"/> </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>ILG Reference</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="/netc/hawb/cs_awbn"/> </fo:block>
						</fo:table-cell>
					</fo:table-row>
					
					<fo:table-row>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Shipper's Name</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="/netc/hawb/ca_cnam"/> </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Receiver's Name</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="/netc/hawb/da_cnam"/></fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Shipper's Address</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="(/netc/hawb/ca_adr1)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/ca_adr2)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/ca_adr3)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/ca_adr4)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/ca_zpcd)"/></fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/ca_co_desc)"/></fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Receiver's Address</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="(/netc/hawb/da_adr1)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/da_adr2)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/da_adr3)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/da_adr4)"/> </fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/da_zpcd)"/></fo:block>
							<fo:block><xsl:value-of select="(/netc/hawb/da_co_desc)"/></fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Contact Details</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="/netc/hawb/ca_phon"/> </fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Contact Details</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block><xsl:value-of select="(/netc/hawb/da_ctnm)"/></fo:block>
							<fo:block>Email: <xsl:value-of select="/netc/hawb/da_emal"/> </fo:block>
							<fo:block>Tel: <xsl:value-of select="/netc/hawb/da_phon"/> </fo:block>
							<fo:block>Mobile: <xsl:value-of select="/netc/hawb/da_mobl"/> </fo:block>
						</fo:table-cell>
					</fo:table-row>

					<fo:table-row>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>Shipper's VAT No.</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000">
							<fo:block>GB 468 7021 29</fo:block>
						</fo:table-cell>
					
					<fo:table-cell padding="5mm" font-weight="bold" number-rows-spanned="2" border="1px solid #000000" text-align="center" background-color="#D3D3D3">
							<fo:block >Total Actual Weight (Kgs)</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="5mm" border="1px solid #000000" number-rows-spanned="2" text-align="center">
							<fo:block><xsl:value-of select="/netc/hawb/cs_twgt"/></fo:block>
						</fo:table-cell>

					</fo:table-row>
					<fo:table-row>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" font-weight="bold" background-color="#D3D3D3">
							<fo:block>No. of Pieces</fo:block>
						</fo:table-cell>
						<fo:table-cell padding="1.5mm" border="1px solid #000000" text-align="center">
							<fo:block><xsl:value-of select="/netc/hawb/cs_nopg"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell >
							<fo:block >
								<fo:table table-layout="fixed"  width="200mm">
								<fo:table-column column-width="23mm"/>
								<fo:table-column column-width="15mm"/>
								<fo:table-column column-width="24mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="31mm"/>
									
										<fo:table-header>
									  <fo:table-row>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Product</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Pieces</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Weight</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Height</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Width</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Depth</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Value</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Currency</fo:block> 
										</fo:table-cell>
										<fo:table-cell border="1px solid #000000" background-color="#D3D3D3" font-weight="bold">
										 <fo:block text-align="center" padding-top="2pt">Commodity code</fo:block> 
										</fo:table-cell>

									  </fo:table-row>
									  </fo:table-header>
									 <fo:table-body>  
								
								<xsl:choose>
								  <xsl:when test="packages/package">

									<xsl:for-each select="packages/package">
										 <xsl:variable name="piece_no">
									       <xsl:value-of select="position()" />
									    </xsl:variable>
										<fo:table-row keep-together="always">
										  <fo:table-cell text-align="left" border="1px solid #000000" padding-left="1pt" padding-top="1pt">
											<fo:block space-after="0.5em">  

											 
											<xsl:value-of select="/netc/hawb/proforma_lines/line[position()=$piece_no]/desc"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="center" border="1px solid #000000" padding-top="1pt">
											<fo:block space-after="0.5em">
											  <xsl:value-of select="we_item"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="right" border="1px solid #000000" padding-right="1pt" padding-top="1pt">
											<fo:block space-after="0.5em">
											  <xsl:value-of select="we_twgt"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="center" border="1px solid #000000" padding-top="1pt">
											<fo:block space-after="0.5em">
											  <xsl:value-of select="we_high"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="center" border="1px solid #000000" padding-top="1pt">
											<fo:block space-after="0.5em">
											  <xsl:value-of select="we_didt"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="center" border="1px solid #000000" padding-top="1pt">
											<fo:block space-after="0.5em">                        
											  <xsl:value-of select="we_dept"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="right" border="1px solid #000000" padding-right="1pt" padding-top="1pt">
											<fo:block space-after="0.5em">
											<xsl:value-of select="/netc/hawb/proforma_lines/line[position()=$piece_no]/tot2"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="center" border="1px solid #000000" padding-top="1pt">
											<fo:block space-after="0.5em">
											<xsl:value-of select="/netc/hawb/proformaCurrency"/>
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="center" border="1px solid #000000" padding-top="1pt">
											<fo:block space-after="0.5em">
											 <xsl:value-of select="/netc/hawb/proforma_lines/line[position()=$piece_no]/cp_cmcd"/>
											</fo:block>
										  </fo:table-cell>
										</fo:table-row>    
									</xsl:for-each>

								  </xsl:when>

									<xsl:otherwise>
										<fo:table-row keep-together="always">
										  <fo:table-cell>
											<fo:block>                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell>
											<fo:block>                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="left" padding="0mm"  padding-left="7mm">
											<fo:block space-after="0.5em">                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="left" padding="0mm"  padding-left="7mm">
											<fo:block space-after="0.5em">                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="left" padding="0mm"  padding-left="7mm">
											<fo:block space-after="0.5em">                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="left" padding="0mm"  padding-left="7mm">
											<fo:block space-after="0.5em">                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="left" padding="0mm"  padding-left="7mm">
											<fo:block space-after="0.5em">                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="left" padding="0mm"  padding-left="7mm">
											<fo:block space-after="0.5em">                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										  <fo:table-cell text-align="left" padding="0mm"  padding-left="7mm">
											<fo:block space-after="0.5em">                        
											  &#160;
											</fo:block>
										  </fo:table-cell>
										</fo:table-row>  
								  </xsl:otherwise>

								</xsl:choose>
							  </fo:table-body>
								</fo:table>
							</fo:block>	
						</fo:table-cell>
					</fo:table-row>	
					<fo:table-row>
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="23mm" />
							  <fo:table-column column-width="180mm" />
							 <fo:table-body>
								<fo:table-row font-family="sans-serif" font-weight="normal" font-size="10pt" >
								  <fo:table-cell border="1px solid #000000" padding-left="2pt" font-weight="bold" background-color="#D3D3D3">
										 <fo:block padding-top="2pt">Description</fo:block> 
										</fo:table-cell>              
								  <fo:table-cell border="1px solid #000000" padding-left="2pt" background-color="#D3D3D3">
										 <fo:block padding-top="2pt">
									  <xsl:if test="/netc/hawb/contentsType">
							<xsl:value-of select="java:toUpperCase(concat(/netc/hawb/cs_cont,''))"/>	
						</xsl:if>
									  </fo:block> 
										</fo:table-cell>
								  
								</fo:table-row>
								 </fo:table-body>
								</fo:table>
						  </fo:block>
                  </fo:table-cell>
                       </fo:table-row>
                    <fo:table-row>
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="20mm"/>
								<fo:table-column column-width="15mm"/>
								<fo:table-column column-width="27mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="22mm"/>
								<fo:table-column column-width="31mm"/>
							 <fo:table-body>
								<fo:table-row font-family="italic" font-weight="normal" font-size="10pt" >
				                    <fo:table-cell number-columns-spanned="6" padding="1mm" border="1px solid #000000" font-size="13pt">
                						<fo:block font-weight="bold" text-align="left">Total Value for customs purposes only</fo:block>
							             </fo:table-cell>
							             <fo:table-cell padding="1mm" border="1px solid #000000" font-weight="bold">
							                <fo:block text-align="right"><xsl:value-of select="totalProforma"/></fo:block>
							             </fo:table-cell>
							                <fo:table-cell padding="1mm" number-columns-spanned="2" border="1px solid #000000" font-weight="bold">
							             <fo:block text-align="left"><xsl:value-of select="proformaCurrency"/></fo:block>
							                </fo:table-cell>
								</fo:table-row>
								 </fo:table-body>
								</fo:table>
						  </fo:block>
                  </fo:table-cell>
                       </fo:table-row>
                   <fo:table-row>
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="35mm" />
							  <fo:table-column column-width="168mm" />
							 <fo:table-body>
								<fo:table-row font-family="sans-serif" font-weight="normal" font-size="10pt" >
								  <fo:table-cell border="1px solid #000000" padding-left="2pt" font-weight="bold" background-color="#D3D3D3">
										 <fo:block padding-top="2pt">Reasons for Export</fo:block> 
										</fo:table-cell>              
								  <fo:table-cell border="1px solid #000000" padding-left="2pt">
										 <fo:block padding-top="2pt" ></fo:block> 
										</fo:table-cell>
								  
								</fo:table-row>
								 </fo:table-body>
								</fo:table>
						  </fo:block>
                  </fo:table-cell>
                       </fo:table-row>

                       <fo:table-row>
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="35mm" />
							  <fo:table-column column-width="168mm" />
							 <fo:table-body>
								<fo:table-row font-family="sans-serif" font-weight="normal" font-size="10pt" >
								  <fo:table-cell border="1px solid #000000" padding-left="2pt" font-weight="bold" background-color="#D3D3D3">
										 <fo:block padding-top="2pt">Terms of Delivery</fo:block> 
										</fo:table-cell>              
								  <fo:table-cell border="1px solid #000000" padding-left="2pt">
										 <fo:block padding-top="2pt" ><xsl:value-of select="/netc/hawb/payor"/></fo:block> 
										</fo:table-cell>
								  
								</fo:table-row>
								 </fo:table-body>
								</fo:table>
						  </fo:block>
                  </fo:table-cell>
                       </fo:table-row>

                      <fo:table-row><fo:table-cell><fo:block >&#160;</fo:block></fo:table-cell></fo:table-row>

                        <fo:table-row keep-together="always">
                  <fo:table-cell text-align="left" padding="0mm">                       
						  <fo:block font-family="sans-serif" font-size="10pt" font-weight="bold" space-after="0.5em" width="200mm">
							<fo:table table-layout="fixed">
							  <fo:table-column column-width="200mm" />
							 <fo:table-body>
								 <xsl:choose>
              						<xsl:when test="/netc/hawb/cs_tref">
								<fo:table-row height="22mm">
									<fo:table-cell text-align="center">
										<fo:block text-align="center">Carrier Tracking Numbers</fo:block>
										<fo:block text-align="center"> 
											<xsl:call-template name="barcode">
												<xsl:with-param name="awbn"><xsl:value-of select="/netc/hawb/cs_tref"/></xsl:with-param>
												<xsl:with-param name="startStop">false</xsl:with-param>
												<xsl:with-param name="humanReadable">true</xsl:with-param>
												<xsl:with-param name="barcodeHeight">15</xsl:with-param>
											</xsl:call-template>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
										</xsl:when>
									 <xsl:otherwise><fo:table-row><fo:table-cell><fo:block >&#160;</fo:block></fo:table-cell></fo:table-row></xsl:otherwise>
									 </xsl:choose>
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
		<fo:instream-foreign-object>
			<barcode:barcode xmlns:barcode="http://barcode4j.krysalis.org/ns" message="{$awbn}">
				<barcode:code128>
					<barcode:height><xsl:value-of select="$barcodeHeight"/>mm</barcode:height>
					<barcode:module-width>0.30mm</barcode:module-width>
					 <xsl:if test="$humanReadable != 'true'">
						 <barcode:human-readable>none</barcode:human-readable>
					 </xsl:if>  
					<barcode:human-readable>
						<barcode:display-start-stop><xsl:value-of select="$startStop"/></barcode:display-start-stop>
            <font-size>10pt</font-size>
					</barcode:human-readable>
				</barcode:code128>
			</barcode:barcode>      
		</fo:instream-foreign-object>
	</xsl:template>

	 <!-- ================================= -->
  <!--         Format date        -->
  <!-- ================================= -->
  <xsl:template name="formatdate">
     <xsl:param name="datestr" />
     <!-- input format mmddyyyy -->
     <!-- output format mm/dd/yyyy -->
 
    
    <xsl:variable name="dd">
       <xsl:value-of select="substring($datestr,1,2)" />
    </xsl:variable>
    
    <xsl:variable name="mm">
       <xsl:value-of select="substring($datestr,4,3)" />
    </xsl:variable>
 
    <xsl:variable name="yyyy">
       <xsl:value-of select="substring($datestr,8,4)" />
    </xsl:variable>
 
    <xsl:value-of select="$mm" />&#160;<xsl:value-of select="$dd" /><xsl:value-of select="','" />&#160;<xsl:value-of select="$yyyy" />
  </xsl:template>
</xsl:stylesheet> 
