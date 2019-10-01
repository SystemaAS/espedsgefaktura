/**
 * 
 */
package no.systema.efaktura.url.store;
import no.systema.main.model.UrlDataStoreAnnotationForField;
import no.systema.main.util.AppConstants;
/**
 * 
 * Static URLs
 * @author oscardelatorre
 * @date Aug 05, 2015
 * 
 * 
 */
public final class EfakturaUrlDataStore {
	
	//----------------------------
	//[1] FETCH MAIN LOG LIST
	//----------------------------
	@UrlDataStoreAnnotationForField (name="@EfakturaMainListController - efaktura_mainlist.do ", description=" --> EFAKTURA_BASE_MAIN_LOG_LIST_URL - main list")
	static public String EFAKTURA_BASE_MAIN_LOG_LIST_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/SYXML33.pgm";
	//http://gw.systema.no/sycgip/SYXML33.pgm?user=OSCAR&avd=&dtf=20150101&dtt=20151010
	//----------------------------------
	//[2] RESEND INVOICE from MAIN LIST
	//----------------------------------
	@UrlDataStoreAnnotationForField (name="@EfakturaMainListController - efaktura_mainlist_resend.do ", description=" --> EFAKTURA_BASE_MAIN_LOG_LIST_RESEND_INVOICE_URL - resend invoice")
	static public String EFAKTURA_BASE_MAIN_LOG_LIST_RESEND_INVOICE_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/SYXML34.pgm";
	//http://gw.systema.no/sycgip/SYXML34.pgm?user=OSCAR&fn=283884&st= (blank in status will trigger resend at back-end)
	
	
	//-------------------
	//[3] CHILD WINDOWS
	//-------------------
	@UrlDataStoreAnnotationForField (name="@EfakturaMainListController - efaktura_childwindow_customer.do ", description=" --> EFAKTURA_BASE_CHILDWINDOW_CUSTOMER_URL - search customer window")
	static public String EFAKTURA_BASE_CHILDWINDOW_CUSTOMER_URL = AppConstants.HTTP_ROOT_CGI + "/sycgip/SYXML35.pgm";
	//http://gw.systema.no/sycgip/TJINQKUND.pgm?user=JOVO&sokknr=1  (SYXML35)
	//flera parametrar är: soknvn, kunpnsted, wsvarnv, maxv
	
	
	
}
