package br.com.casadocodigo.loja.viewresolver;

import java.util.Locale;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.xml.MappingJackson2XmlView;


public class XmlViewResolver  implements ViewResolver{
	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		MappingJackson2XmlView view = new MappingJackson2XmlView();
		view.setPrettyPrint(true);// mostra a forma que  será impresso o json formatado  ou sem formatar
		return view;
	}

}
