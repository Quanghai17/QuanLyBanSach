jQuery(document).ready(function (a) {
    'use strict';
    function volazj_google_maps() {
        if ($('.volazj-google-maps').length <= 0) {
            return;
        }
        $('.volazj-google-maps').each(function () {
            var $this = $(this),
                $id = $this.attr('id'),
                $title_maps = $this.attr('data-title_maps'),
                $phone = $this.attr('data-phone'),
                $email = $this.attr('data-email'),
                $zoom = parseInt($this.attr('data-zoom'), 10),
                $latitude = $this.attr('data-latitude'),
                $longitude = $this.attr('data-longitude'),
                $address = $this.attr('data-address'),
                $map_type = $this.attr('data-map-type'),
                $pin_icon = $this.attr('data-pin-icon'),
                $modify_coloring = true,
                $saturation = $this.attr('data-saturation'),
                $hue = $this.attr('data-hue'),
                $map_style = $this.data('map-style'),
                $styles;

            if ($modify_coloring == true) {
                var $styles = [
                    {
                        stylers: [
                            {hue: $hue},
                            {invert_lightness: false},
                            {saturation: $saturation},
                            {lightness: 1},
                            {
                                featureType: "landscape.man_made",
                                stylers: [{
                                    visibility: "on"
                                }]
                            }
                        ]
                    }, {
                        "featureType": "all",
                        "elementType": "labels.text.fill",
                        "stylers": [{"saturation": 36}, {"color": "#000000"}, {"lightness": 40}]
                    }, {
                        "featureType": "all",
                        "elementType": "labels.text.stroke",
                        "stylers": [{"visibility": "on"}, {"color": "#000000"}, {"lightness": 16}]
                    }, {
                        "featureType": "all",
                        "elementType": "labels.icon",
                        "stylers": [{"visibility": "off"}]
                    }, {
                        "featureType": "administrative",
                        "elementType": "geometry.fill",
                        "stylers": [{"color": "#000000"}, {"lightness": 20}]
                    }, {
                        "featureType": "administrative",
                        "elementType": "geometry.stroke",
                        "stylers": [{"color": "#000000"}, {"lightness": 17}, {"weight": 1.2}]
                    }, {
                        "featureType": "landscape",
                        "elementType": "geometry",
                        "stylers": [{"color": "#000000"}, {"lightness": 20}]
                    }, {
                        "featureType": "poi",
                        "elementType": "geometry",
                        "stylers": [{"color": "#000000"}, {"lightness": 21}]
                    }, {
                        "featureType": "road.highway",
                        "elementType": "geometry.fill",
                        "stylers": [{"color": "#000000"}, {"lightness": 17}]
                    }, {
                        "featureType": "road.highway",
                        "elementType": "geometry.stroke",
                        "stylers": [{"color": "#000000"}, {"lightness": 29}, {"weight": 0.2}]
                    }, {
                        "featureType": "road.arterial",
                        "elementType": "geometry",
                        "stylers": [{"color": "#000000"}, {"lightness": 18}]
                    }, {
                        "featureType": "road.local",
                        "elementType": "geometry",
                        "stylers": [{"color": "#000000"}, {"lightness": 16}]
                    }, {
                        "featureType": "transit",
                        "elementType": "geometry",
                        "stylers": [{"color": "#000000"}, {"lightness": 19}]
                    }, {
                        "featureType": "water",
                        "elementType": "geometry",
                        "stylers": [{"color": "#000000"}, {"lightness": 17}]
                    }
                ];
            }
            var map;
            var bounds = new google.maps.LatLngBounds();
            var mapOptions = {
                zoom: $zoom,
                panControl: true,
                zoomControl: true,
                mapTypeControl: true,
                scaleControl: true,
                draggable: true,
                scrollwheel: false,
                mapTypeId: google.maps.MapTypeId[$map_type],
                styles: $styles
            };

            map = new google.maps.Map(document.getElementById($id), mapOptions);
            map.setTilt(45);

            // Multiple Markers
            var markers = [];
            var infoWindowContent = [];

            if ($latitude != '' && $longitude != '') {
                markers[0] = [$address, $latitude, $longitude];
                infoWindowContent[0] = [$address];
            }

            var infoWindow = new google.maps.InfoWindow(), marker, i;

            for (i = 0; i < markers.length; i++) {
                var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
                bounds.extend(position);
                marker = new google.maps.Marker({
                    position: position,
                    map: map,
                    title: markers[i][0],
                    icon: $pin_icon
                });

                map.fitBounds(bounds);
            }

            var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function (event) {
                this.setZoom($zoom);
                google.maps.event.removeListener(boundsListener);
            });
        });
    }
    function g() {
        a(".owl-carousel").each(function (u, t) {
            var s = a(this).data();
            s.navText = ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>'];
            var r = a(this).data("animateout");
            var q = a(this).data("animatein");
            var w = a(this).data("slidespeed");
            if (typeof r != "undefined") {
                s.animateOut = r
            }
            if (typeof q != "undefined") {
                s.animateIn = q
            }
            if (typeof(w) != "undefined") {
                s.smartSpeed = w
            }
            var v = a(this);
            v.on("initialized.owl.carousel", function (x) {
                var z = v.find(".owl-item.active").length;
                var y = 0;
                v.find(".owl-item").removeClass("item-first item-last");
                setTimeout(function () {
                    v.find(".owl-item.active").each(function () {
                        y++;
                        if (y == 1) {
                            a(this).addClass("item-first")
                        }
                        if (y == z) {
                            a(this).addClass("item-last")
                        }
                    })
                }, 100)
            });
            v.on("refreshed.owl.carousel", function (x) {
                var z = v.find(".owl-item.active").length;
                var y = 0;
                v.find(".owl-item").removeClass("item-first item-last");
                setTimeout(function () {
                    v.find(".owl-item.active").each(function () {
                        y++;
                        if (y == 1) {
                            a(this).addClass("item-first")
                        }
                        if (y == z) {
                            a(this).addClass("item-last")
                        }
                    })
                }, 100)
            });
            v.on("change.owl.carousel", function (x) {
                var z = v.find(".owl-item.active").length;
                var y = 0;
                v.find(".owl-item").removeClass("item-first item-last");
                setTimeout(function () {
                    v.find(".owl-item.active").each(function () {
                        y++;
                        if (y == 1) {
                            a(this).addClass("item-first")
                        }
                        if (y == z) {
                            a(this).addClass("item-last")
                        }
                    })
                }, 100);
                v.addClass("owl-changed");
                setTimeout(function () {
                    v.removeClass("owl-changed")
                }, s.smartSpeed)
            });
            v.on("drag.owl.carousel", function (x) {
                v.addClass("owl-changed");
                setTimeout(function () {
                    v.removeClass("owl-changed")
                }, s.smartSpeed)
            });
            v.owlCarousel(s)
        })
    }

    function l() {
        if (a(".kt-countdown").length > 0) {
            var q = ["Years", "Months", "Weeks", "Days", "Hrs", "Mins", "Secs"];
            var r = '<span class="box-count day"><span class="number">{dnn}</span> <span class="text">Days</span></span><span class="dot">:</span><span class="box-count hrs"><span class="number">{hnn}</span> <span class="text">Hrs</span></span><span class="dot">:</span><span class="box-count min"><span class="number">{mnn}</span> <span class="text">Mins</span></span><span class="dot">:</span><span class="box-count secs"><span class="number">{snn}</span> <span class="text">Secs</span></span>';
            a(".kt-countdown").each(function () {
                var s = new Date(a(this).data("y"), a(this).data("m") - 1, a(this).data("d"), a(this).data("h"), a(this).data("i"), a(this).data("s"));
                a(this).countdown({until: s, labels: q, layout: r})
            })
        }
    }

    function n() {
        a(document).on("click", '.tab-product-fade-effect a[data-toggle="tab"]', function () {
            var r = a(this).attr("href");
            var q = a(this).data("animated");
            q = (q == undefined || q == "") ? "fadeInUp" : q;
            a(r).find(".product-item").each(function (u) {
                var w = a(this);
                var v = a(this).attr("style");
                v = (v == undefined) ? "" : v;
                var s = u * 50;
                w.attr("style", v + ";-webkit-animation-delay:" + s + "ms;-moz-animation-delay:" + s + "ms;-o-animation-delay:" + s + "ms;animation-delay:" + s + "ms;").addClass(q + " animated").one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend", function () {
                    w.removeClass(q + " animated");
                    w.attr("style", v)
                })
            })
        })
    }

    function j() {
        var q = (Modernizr.touch) ? true : false;
        if (q === true) {
            a(document).on("click", ".volazj-nav .menu-item-has-children >a", function (r) {
                var t = a(this).closest("li");
                var u = a(".volazj-nav .menu-item-has-children");
                if (!t.hasClass("show-submenu")) {
                    u.removeClass("show-submenu");
                    t.parents().each(function () {
                        if (a(this).hasClass("menu-item-has-children")) {
                            a(this).addClass("show-submenu")
                        }
                        if (a(this).hasClass("main-menu")) {
                            return false
                        }
                    });
                    t.addClass("show-submenu");
                    if (!t.hasClass("show-submenu")) {
                        t.find("li").removeClass("show-submenu")
                    }
                    return false;
                    r.preventDefault()
                } else {
                    t.removeClass("show-submenu");
                    var s = a(this).attr("href");
                    if (a.trim(s) == "" || a.trim(s) == "#") {
                        t.toggleClass("show-submenu")
                    } else {
                        window.location = s
                    }
                }
                if (!t.hasClass("show-submenu")) {
                    t.find("li").removeClass("show-submenu")
                }
                r.stopPropagation()
            });
            a(document).on("click", function (r) {
                var s = a(r.target);
                if (!s.closest(".show-submenu").length || !s.closest(".volazj-nav").length) {
                    a(".show-submenu").removeClass("show-submenu")
                }
            })
        } else {
            a(document).on("mousemove", ".volazj-nav .menu-item-has-children", function () {
                a(this).addClass("show-submenu");
                if (a(this).closest(".volazj-nav").hasClass("main-menu")) {
                    a("body").addClass("is-show-menu")
                }
            });
            a(document).on("mouseout", ".volazj-nav .menu-item-has-children", function () {
                a(this).removeClass("show-submenu");
                a("body").removeClass("is-show-menu")
            })
        }
    }

    function k() {
        var t = jQuery("body").innerWidth();
        t += i();
        if (t > 991) {
            if (a(".site-header .header-menu-resize").length > 0) {
                var q = a(".site-header .header-menu-resize");
                if (q != "undefined") {
                    var s = 0;
                    s = q.innerWidth();
                    var r = q.offset();
                    setTimeout(function () {
                        a(".header-menu .item-megamenu").each(function (x, w) {
                            a(w).children(".megamenu").css({"max-width": s + "px"});
                            var D = a(w).children(".megamenu").outerWidth();
                            var z = a(w).outerWidth();
                            a(w).children(".megamenu").css({left: "-" + (D / 2 - z / 2) + "px"});
                            var u = r.left;
                            var v = (u + s);
                            var y = a(w).offset().left;
                            var B = (D / 2 > (y - u));
                            var C = ((D / 2 + y) > v);
                            if (B) {
                                var A = (y - u);
                                a(w).children(".megamenu").css({left: -A + "px"})
                            }
                            if (C && !B) {
                                var A = (y - u);
                                A = A - (s - D);
                                a(w).children(".megamenu").css({left: -A + "px"})
                            }
                        })
                    }, 100)
                }
            }
        }
    }

    function i() {
        var q = jQuery('<div style="width: 100%; height:200px;">test</div>'),
            r = jQuery('<div style="width:200px;height:150px; position: absolute; top: 0; left: 0; visibility: hidden; overflow:hidden;"></div>').append(q),
            s = q[0], t = r[0];
        jQuery("body").append(t);
        var u = s.offsetWidth;
        r.css("overflow", "scroll");
        var v = t.clientWidth;
        r.remove();
        return (u - v)
    }

    function h() {
        var q = parseFloat(a(".container").actual("width"));
        var r = parseFloat(a(".vertical-menu-content").actual("width"));
        var s = (q - r);
        a(".vertical-menu-content").find(".megamenu").each(function () {
            a(this).css("max-width", s + "px")
        })
    }

    function c() {
        setTimeout(function () {
            a(".equal-container").each(function () {
                var q = a(this);
                if (q.find(".equal-elem").length) {
                    q.find(".equal-elem").css({height: "auto"});
                    var r = 0;
                    q.find(".equal-elem").each(function () {
                        var s = parseFloat(a(this).height());
                        if (r < s) {
                            r = s
                        }
                    });
                    q.find(".equal-elem").height(r)
                }
            })
        }, 3000)
    }

    function m() {
        a(".slider-range-price").each(function () {
            var s = parseFloat(a(this).data("min"));
            var r = parseFloat(a(this).data("max"));
            var v = a(this).data("unit");
            var x = parseFloat(a(this).data("value-min"));
            var w = parseFloat(a(this).data("value-max"));
            var q = a(this).data("label-reasult");
            var u = a(this);
            a(this).slider({
                range: true, min: s, max: r, values: [x, w], slide: function (t, z) {
                    var y = q + " <span>" + v + z.values[0] + " </span> - <span> " + v + z.values[1] + "</span>";
                    u.closest(".price_slider_wrapper").find(".price_slider_amount").html(y)
                }
            })
        })
    }

    function o() {
        a(document).on("click", ".quantity .plus, .quantity .minus", function (s) {
            var q = a(this).closest(".quantity").find(".qty"), r = parseFloat(q.val()), t = parseFloat(q.attr("max")),
                u = parseFloat(q.attr("min")), v = q.attr("step");
            if (!r || r === "" || r === "NaN") {
                r = 0
            }
            if (t === "" || t === "NaN") {
                t = ""
            }
            if (u === "" || u === "NaN") {
                u = 0
            }
            if (v === "any" || v === "" || v === undefined || parseFloat(v) === "NaN") {
                v = 1
            }
            if (a(this).is(".plus")) {
                if (t && (t == r || r > t)) {
                    q.val(t)
                } else {
                    q.val(r + parseFloat(v))
                }
            } else {
                if (u && (u == r || r < u)) {
                    q.val(u)
                } else {
                    if (r > 0) {
                        q.val(r - parseFloat(v))
                    }
                }
            }
            q.trigger("change");
            s.preventDefault()
        })
    }

    function e() {
        a(".header-nav .toggle-submenu").on("click", function () {
            a(this).parent().toggleClass("open-submenu");
            return false
        });
        a("[data-action='toggle-nav']").on("click", function () {
            a(this).toggleClass("active");
            a(".header-nav").toggleClass("has-open");
            a("body").toggleClass("menu-open");
            return false
        });
        a(".header-menu .btn-close").on("click", function () {
            a(".header-nav").removeClass("has-open");
            return false
        });
        a(".box-vertical-megamenus .title").on("click", function () {
            a(this).toggleClass("active");
            a(this).parent().toggleClass("has-open");
            a("body").toggleClass("categori-open");
            return false
        });
        a(".vertical-menu-content .btn-close").on("click", function () {
            a(".box-vertical-megamenus").removeClass("has-open");
            return false
        });
        a(".box-vertical-megamenus .toggle-submenu").on("click", function () {
            a(this).parent().toggleClass("open-submenu");
            return false
        });
        a(".nav-right .search-hidden").on("click", function () {
            a(".block-search-mobile").addClass("open");
            return false
        });
        a(".quick-view").on("click", function () {
            a(".block-quick-view-popup").addClass("open");
            return false
        });
        a(".popup-btn-close").on("click", function () {
            a(".block-quick-view-popup").removeClass("open");
            return false
        });
        a(".block-search-mobile .close-block-serach").on("click", function () {
            a(".block-search-mobile").removeClass("open");
            return false
        });
        a(".about-text-info").on("click", ".about-text-title", function () {
            a(".about-text-title").not(this).removeClass("active");
            a(this).toggleClass("active");
            return false
        });
        a("#scrollup").on("click", function () {
            a("html, body").animate({scrollTop: 0}, 600);
            return false
        })
    }

    function d(r) {
        var s = a(window).scrollTop();
        if (a(window).width() > 991) {
            var q = a(".header-menu-bar").offset().top;
            if (s >= q) {
                a(".vertical-menu-content").addClass("is-home")
            } else {
                a(".vertical-menu-content").removeClass("is-home")
            }
        }
    }

    function f() {
        if (a.fancybox) {
            a.fancybox.defaults.direction = {next: "left", prev: "right"}
        }
        if (a(".fancybox_item").length) {
            a(".fancybox_item").fancybox({
                openEffect: "elastic",
                closeEffect: "elastic",
                helpers: {overlay: {css: {background: "rgba(0,0,0, .6)"}}, thumbs: {width: 50, height: 50}}
            })
        }
        if (a(".fancybox_item_media").length) {
            a(".fancybox_item_media").fancybox({openEffect: "none", closeEffect: "none", helpers: {media: {}}})
        }
    }

    function b(q) {
        if (a.arcticmodal) {
            a.arcticmodal("setDefault", {
                type: "ajax", ajax: {cache: false}, afterOpen: function (s) {
                    var r = a(".modal_window");
                    r.find(".custom_select").customSelect();
                    r.find(".product_preview .owl_carousel").owlCarousel({
                        margin: 10,
                        themeClass: "thumbnails_carousel",
                        nav: true,
                        navText: [],
                        rtl: window.ISRTL ? true : false
                    });
                    Core.events.productPreview();
                    addthis.toolbox(".addthis_toolbox")
                }
            })
        }
    }

    function p(q) {
        if (a("#img_zoom").length) {
            a("#img_zoom").elevateZoom({
                zoomType: "inner",
                gallery: "thumbnails",
                galleryActiveClass: "active",
                cursor: "crosshair",
                responsive: true,
                easing: true,
                zoomWindowFadeIn: 500,
                zoomWindowFadeOut: 500,
                lensFadeIn: 500,
                lensFadeOut: 500
            });
            a(".open_qv").on("click", function (r) {
                var s = a(this).siblings("img").data("elevateZoom");
                a.fancybox(s.getGalleryList());
                r.preventDefault()
            })
        }
    }
    $(document).on("ready", function () {
        volazj_google_maps();
    });
    a(window).on("load", function () {
        k();
        c()
    });
    a(window).on("resize", function () {
        k();
        c();
        h();
        j()
    });
    a(window).on("scroll", function () {
        if (a(this).scrollTop() > 100) {
            a("#scrollup").fadeIn()
        } else {
            a("#scrollup").fadeOut()
        }
        k();
        d()
    });
    new WOW().init();
    a(".header-menu-bar ").sticky({topSpacing: 0});
    if (a(".chosen-select").length > 0) {
        a(".chosen-select").chosen()
    }
    if (a("#popup-newsletter").length > 0) {
        a("#popup-newsletter").modal({keyboard: false})
    }
    m();
    o();
    e();
    g();
    n();
    l();
    k();
    h();
    j();
    p();
    b();
    f();
    d()
});