package BD;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the Categoria database table.
 * 
 */
@Entity
@NamedQuery(name="Categoria.findAll", query="SELECT c FROM Categoria c")
public class Categoria implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idCategoria;

	@Column(name="Subtema")
	private String subtema;

	@Column(name="Tema")
	private String tema;

	//bi-directional many-to-one association to Noticia
	@OneToMany(mappedBy="categoria")
	private List<Noticia> noticias;

	//bi-directional many-to-many association to Usuario
	@ManyToMany
	@JoinTable(
		name="Usuarios_has_Categoria"
		, joinColumns={
			@JoinColumn(name="Categoria_idCategoria")
			}
		, inverseJoinColumns={
			@JoinColumn(name="Usuarios_idUsuarios")
			}
		)
	private List<Usuario> usuarios;

	public Categoria() {
	}

	public int getIdCategoria() {
		return this.idCategoria;
	}

	public void setIdCategoria(int idCategoria) {
		this.idCategoria = idCategoria;
	}

	public String getSubtema() {
		return this.subtema;
	}

	public void setSubtema(String subtema) {
		this.subtema = subtema;
	}

	public String getTema() {
		return this.tema;
	}

	public void setTema(String tema) {
		this.tema = tema;
	}

	public List<Noticia> getNoticias() {
		return this.noticias;
	}

	public void setNoticias(List<Noticia> noticias) {
		this.noticias = noticias;
	}

	public Noticia addNoticia(Noticia noticia) {
		getNoticias().add(noticia);
		noticia.setCategoria(this);

		return noticia;
	}

	public Noticia removeNoticia(Noticia noticia) {
		getNoticias().remove(noticia);
		noticia.setCategoria(null);

		return noticia;
	}

	public List<Usuario> getUsuarios() {
		return this.usuarios;
	}

	public void setUsuarios(List<Usuario> usuarios) {
		this.usuarios = usuarios;
	}

}