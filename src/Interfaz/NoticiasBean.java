package Interfaz;

import java.util.List;

import javax.ejb.EJB;
import javax.faces.bean.ApplicationScoped;
import javax.faces.bean.ManagedBean;

import logica.EcloudEJB;

@ManagedBean
@ApplicationScoped
public class NoticiasBean {

	@EJB
	private EcloudEJB ejb;
	
	public List<NoticiaBean> getListaUniversidad(){
		return null;
		//return ejb.getListaUniversidad;
	}
}
