<!DOCTYPE html>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include.jsp" %> <!-- generally you will include this in a header.jsp -->

<html>
	<head>
		<link href="/espedsg2/resources/${user.cssEspedsg}?ver=${user.versionEspedsg}" rel="stylesheet" type="text/css"/>
		<link href="resources/jquery.calculator.css" rel="stylesheet" type="text/css"/>
		
		<%-- datatables grid CSS --%>
		<link type="text/css" href="//cdn.datatables.net/1.10.11/css/jquery.dataTables.css" rel="stylesheet">
		<link type="text/css" href="//cdn.datatables.net/responsive/1.0.7/css/responsive.dataTables.min.css" rel="stylesheet">
		<link type="text/css" href="//cdn.datatables.net/plug-ins/1.10.19/features/searchHighlight/dataTables.searchHighlight.css" rel="stylesheet">
		
		<c:choose>
			<c:when test="${ fn:contains(user.cssEspedsg, 'Toten') }"> 
				<link rel="SHORTCUT ICON" type="image/ico" href="resources/images/toten_ico.ico"></link>
			</c:when>
			<c:otherwise>
				<link rel="SHORTCUT ICON" type="image/png" href="resources/images/systema_logo.png"></link>
			</c:otherwise>
		</c:choose>
		
		<%-- for dialog popup --%>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
		<style type = "text/css">
			.ui-dialog{font-size:10pt;}
		</style>
		
		<%-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> --%>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE" />
		<%-- Cache disabled --%>
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="expires" content="0">
		
		<title>eSpedsg - eFaktura Log</title>
	</head>
	<body>
	<%-- include som javascript functions --%>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js""></script>
	<script type="text/javascript" src="resources/js/jquery.blockUI.js"></script>
	<script type="text/javascript" src="resources/js/systemaWebGlobal.js?ver=${user.versionEspedsg}"></script>
	<SCRIPT type="text/javascript" src="resources/js/headerEfaktura.js?ver=${user.versionEspedsg}"></SCRIPT>
	
	<%--datatables grid --%>
	<script type="text/javascript" src="//cdn.datatables.net/1.10.11/js/jquery.dataTables.min.js"></script>
	<%-- searchHighlight on datatables --%>
	<script type="text/javascript" src="//bartaz.github.io/sandbox.js/jquery.highlight.js"></script>
	<script type="text/javascript" src="//cdn.datatables.net/responsive/1.0.7/js/dataTables.responsive.min.js"></script>
	<script type="text/javascript" src="//cdn.datatables.net/plug-ins/1.10.19/features/searchHighlight/dataTables.searchHighlight.min.js"></script>

	<input type="hidden" name="language" id=language value="${user.usrLang}">
	
	
    <table class="noBg" width="100%" border="0" cellspacing="0" cellpadding="0">
		<%--Banner --%>
	 	<tr class="clazzTdsBanner" id="tdsBanner" style="visibility:visible">
	 	 	<%-- class="grayTitanBg" --%>
		 	<td height="60" class="headerTdsBannerAreaBg" width="100%" align="left" colspan="3"> 
	    			 <table width="100%" border="0" cellspacing="0" cellpadding="0">
	    			 	<tr>
				        	<td>&nbsp;</td>
				        	<td>&nbsp;</td>
					 		<td>&nbsp;</td>
				        </tr>
					 	<tr>
					 		<c:choose>
						 		<c:when test="${not empty user.logo}">
					 				<c:choose>
						 				<c:when test="${fn:contains(user.logo, '/')}">
						 					<td class="text12" width="10%" align="center" valign="middle" >
												<img src="${user.logo}" border="0" >
											</td>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${fn:contains(user.logo, 'systema')}">
												<td class="text12white" width="10%" align=left valign="bottom" >&nbsp;
													<img src="resources/images/${user.logo}" border="0" width=80px height=50px>
												</td>
												</c:when>
												<c:otherwise>
													<c:if test="${fn:contains(user.logo, 'logo')}">
														<td class="text12white" width="10%" align=left valign="bottom" >&nbsp;
															<img src="resources/images/${user.logo}" border="0" >
														</td>
													</c:if>
												</c:otherwise>
											</c:choose>	
										</c:otherwise>
									</c:choose>
	   			 				</c:when> 
	   			 				<c:otherwise>
							 		<td class="text12white" width="10%" align=left valign="bottom" >&nbsp;</td>
							 		<%-- <td class="text12white" width="10%" align=right valign="bottom" >&nbsp;</td>--%>
						 		</c:otherwise>
					 		</c:choose>
					 		<td class="text32Bold" width="100%" align="center" valign="middle" style="color:#778899;" >
					 			eSped<font style="color:#003300;">sg</font> - <spring:message code="systema.efaktura.title"/>
					 			
					 		</td>
					 		
					 		<td class="text14" width="10%" align="center" valign="middle" >
			 					<c:if test="${not empty user.systemaLogo && (user.systemaLogo=='Y')}">
				 					<img src="resources/images/systema_logo.png" border="0" width=80px height=50px >
				 				</c:if>
				 			</td> 
				    		
				        </tr>
				        <tr>
				        	<td>&nbsp;</td>
				        	<td>&nbsp;</td>
					 		<td class="text14" width="10%" align=right valign="bottom" >&nbsp;</td>
				        </tr>
				        <tr class="text" height="1"><td></td></tr>
				     </table> 
			</td>
		</tr>
		
		<tr >
			<td height="23" class="tabThinBorderLightGreenLogoutE2" width="100%" align="left" colspan="3"> 
    			 <table width="100%" border="0" cellspacing="0" cellpadding="0">
				 	<tr >
			    		<td class="text14" width="70%" align="left" >&nbsp;&nbsp;
			    			<%-- --------------------------- --%>
			    			<%-- eFkatura MENU --%>
			    			<%-- --------------------------- --%>
			    			<a tabindex=-1 href="efaktura_mainlist.do?action=doFind">
			    				&nbsp;<font 
			    				<c:choose>           
		                   			<c:when test="${user.activeMenu=='EFAKTURA'}">
		                       			class="headerMenuMediumGreen"
		                   			</c:when>
		                   			<c:otherwise>   
		                       			class="headerMenuLightGreen"
		                   			</c:otherwise>
		               			</c:choose>
			    				
			    				>&nbsp;<spring:message code="systema.efaktura.menu"/>&nbsp;</font>
			    			</a>
			    			</td>		      				
	      				<td class="text14" width="50%" align="right" valign="middle">
	      					<c:if test="${ empty user.usrLang || user.usrLang == 'NO'}">
			               		<img src="resources/images/countryFlags/Flag_NO.gif" height="12" border="0" alt="country">
			               	</c:if>
			               	<c:if test="${ user.usrLang == 'DA'}">
			               		<img src="resources/images/countryFlags/Flag_DK.gif" height="12" border="0" alt="country">
			               	</c:if>
			               	<c:if test="${ user.usrLang == 'SV'}">
			               		<img src="resources/images/countryFlags/Flag_SE.gif" height="12" border="0" alt="country">
			               	</c:if>
			               	<c:if test="${ user.usrLang == 'EN'}">
			               		<img src="resources/images/countryFlags/Flag_UK.gif" height="12" border="0" alt="country">
			               	</c:if>
			               	&nbsp;
			               	
		      				<font class="headerMenuGreen">
			    				<img src="resources/images/appUser.gif" border="0" onClick="showPop('specialInformationAdmin');" > 
						        <span style="position:absolute; left:100px; top:150px; width:1000px; height:400px;" id="specialInformationAdmin" class="popupWithInputText"  >
						           		<div class="text11" align="left">
						           			${activeUrlRPG_TODO}
						           			<br/><br/>
						           			<button name="specialInformationButtonClose" class="buttonGrayInsideDivPopup" type="button" onClick="hidePop('specialInformationAdmin');">Close</button> 
						           		</div>
						        </span>   		
			    				<font class="text14User"  >${user.user}&nbsp;</font>${user.usrLang}</font>
			    				<font color="#FFFFFF"; style="font-weight: bold;">&nbsp;|&nbsp;&nbsp;</font>
				    			<a tabindex=-1 href="logout.do">
				    				<font class="headerMenuGreen"><img src="resources/images/home.gif" border="0">&nbsp;
				    					<font class="text14User"  ><spring:message code="dashboard.menu.button"/>&nbsp;</font>
				    				</font>
				    			</a>
				    			<font color="#FFFFFF"; style="font-weight: bold;">&nbsp;&nbsp;|&nbsp;</font>
				    			<font class="text12LightGreen" style="cursor:pointer;" onClick="showPop('versionInfo');">${user.versionSpring}&nbsp;</font>
		    				    	<div class="text12" style="position: relative;display: inline;" align="left">
									<span style="position:absolute; left:-150px; top:3px;" id="versionInfo" class="popupWithInputText"  >
						           		<div class="text12" align="left">
						           			<b>${user.versionEspedsg}</b>
						           			<p>
						           				&nbsp;<a id="alinkLog4jLogger" ><font class="text14LightGreen" style="cursor:pointer;">logsg</font></a><br/>
						           			</p>
						           			<button name="versionInformationButtonClose" class="buttonGrayInsideDivPopup" type="button" onClick="hidePop('versionInfo');">Close</button> 
						           		</div>
						           	</span>
						           	</div> 
				    		</td>
	      				
			        </tr>
			     </table> 
			</td>
	    </tr>
	    	<tr class="text" height="8"><td></td></tr>
		    
	    <%-- Validation Error section --%>
	    <c:if test="${errorMessage!=null}">
		<tr>
			<td colspan=3>
			<table>
					<tr>
					<td class="textError">					
			            <ul>
			                <li >
			                	${errorMessage}
			                </li>
			            
			            </ul>
					</td>
					</tr>
			</table>
			</td>
		</tr>
		</c:if>
		
		<%-- ------------------------- --%>
		<%-- DIALOG render log4j.log   --%>
		<%-- ------------------------- --%>
		<tr>
		<td>
			<div id="dialogLogger" title="Dialog" style="display:none">
				<form>
			 	<table>
			 		<tr>
						<td colspan="3" class="text14" align="left" >Password</td>
  						</tr>
					<tr >
						<td>
							<input type="password" class="inputText" id="pwd" name="pwd" size="15" maxlength="15" value=''>
						</td>
					</tr>
					<tr height="5"><td></td></tr>
  					<tr >
						<td>
							<input type="text" class="inputText" id="logLevel" name="logLevel" size="8" maxlength="8" value=''>
						</td>
					</tr>
  					<tr height="10"><td></td></tr>
					<tr>
						<td colspan="3" class="text14MediumBlue" align="left">
							<label id="loggerStatus"></label>
						</td>
					</tr>
				</table>
				</form>
			</div>
		</td>
		</tr>
		
		

	    <tr class="text" height="2"><td></td></tr>
		
		<%-- ------------------------------------
		Content after banner och header menu
		------------------------------------- --%>
		<tr>
    		<td width="100%" align="left" colspan="3"> 
    		     
     