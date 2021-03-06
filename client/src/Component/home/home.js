import React from "react";

import Header from "../Header/header";
import Footer from "../footer/footer";
import ProductBox from "../product/productBox";
import NewestLetter from "../newestLetter/newestLetter";
// import OwlCarousel from "react-owl-carousel";
// import "owl.carousel/dist/assets/owl.carousel.css";
// import "owl.carousel/dist/assets/owl.theme.default.css";

import Cookies from "universal-cookie";
const cookies = new Cookies();
// cookies.get('Cart');
// console.log(cookies.get('myCat')); // Pacman
class Home extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      product: [],
      url: [],
      Url: [],
      newestPr: [],
      Cart: [],
    };
  }

  componentDidMount() {
    //fetch product &newest product
    fetch("http://localhost:8080/products")
      .then((res) => res.json())
      .then(
        (result) => {
          console.log(result);
          this.setState({
            isLoaded: true,
            product: result.products || [],
            url: result.url,
          });
          console.log(typeof this.state.product);
          console.log(result);
        },
        // error handler
        (error) => {
          this.setState({
            isLoaded: true,
            error,
          });
          console.log("error");
        }
      );
  }
  render() {
    return (
      <div>
        <Header />
        <div className="container">
          <div className="row">
            <div className="col-md-12">
              <div className="section-title">
                <h3 className="title">Sản phẩm nổi bật</h3>
              </div>
            </div>
          </div>

          <div className="row" style={{ width: "100%" }}>
            <div className="col-md-12">
              <div className="center">
                <div className="btn btn-primary m-3 btn-lg">Đồng hồ nam</div>
                <div className="btn btn-danger m-3 btn-lg">Đồng hồ nữ</div>
              </div>
            </div>
          </div>

          <div className="container">
            {/* <div className="row">
              {this.state.product.length && (
                <OwlCarousel
                  className="owl-theme"
                  loop
                  margin={10}
                  nav
                  autoplay={true}
                  responsive={{
                    0: {
                      items: 1,
                    },
                    450: {
                      items: 1,
                    },
                    600: {
                      items: 2,
                    },
                    1000: {
                      items: 3,
                    },
                  }}
                >
                  {this.state.product.map((index, key) => (
                    <ProductBox
                      id={index.idproduct}
                      name={index.nameproduct}
                      price={index.price}
                      url={this.state.url[key].urlimage}
                      key={key}
                      isNew={true}
                    />
                  ))}
                </OwlCarousel>
              )}
            </div> */}
          </div>
        </div>

        <div className="section">
          <div className="container">
            <div className="row">
              <div className="col-md-12">
                <div className="section-title">
                  <h3 className="title">Sản phẩm</h3>
                </div>
              </div>
            </div>

            <div className="row">
              <div className="products-tabs">
                <div id="tab2" className="tab-pane fade in active">
                  <div className="products-slick" data-nav="#slick-nav-2">
                    {this.state.product.map((index, key) => {
                      // console.log(index.);
                      return (
                        <ProductBox
                          id={index.idLoaiDongHo}
                          name={index.ten?.toString()}
                          price={index.giaTien}
                          url={index.urlAnh}
                          key={index.ten}
                          isNew={key <= 1}
                        />
                      );
                    })}
                  </div>
                  <div id="slick-nav-2" className="products-slick-nav"></div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <NewestLetter />

        <Footer />
      </div>
    );
  }
}

export default Home;
