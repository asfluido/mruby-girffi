[mruby]: https://github.com/mruby/mruby
[mrb-gir]: https://github.com/ppibburr/mruby-gobject-introspection
[cfunc]: https://github.com/mobiruby/mruby-cfunc
[mrb-ffi]: https://github.com/schmurfy/mruby-rubyffi-compat
[alloc]: https://github.com/ppibburr/mruby-allocate
[nc]:   https://github.com/ppibburr/mruby-named-constants
[ffi]:  https://github.com/ffi/ffi
[gir]: http://developer.gnome.org/gi/unstable/gi-girepository.html
[gobject]: https://developer.gnome.org/gobject/stable/
[glib]: https://developer.gnome.org/glib/stable/
[mrb-glib2]: https://github.com/ppibburr/mruby-glib2/
[mrb-gobject]: https://github.com/ppibburr/mruby-gobject/
[mrb-gtk2]: https://github.com/ppibburr/mruby-gtk2/
[mrb-gtk3]: https://github.com/ppibburr/mruby-gtk3/
[mrb-webkit-1]: https://github.com/ppibburr/mruby-webkit-1/
[mrb-webkit-3]: https://github.com/ppibburr/mruby-webkit-3/
[mrb-girffi-docgen]: https://github.com/ppibburr/mruby-girffi-docgen/
Synopsis
===
[MRuby][mruby] library that provides complete API access to C libraries introspectable by [GObjectIntropsection][gir]
Bindings are dynamicaly generated as needed via usage of [mruby-gobject-intropsection][mrb-gir]

Will also run on CRuby 1.9.x, [mruby-gobject-intropsection][mrb-gir]'s mrblib and `ffi` are required.  
(However this is a secondary objective as the primary target is [mruby][mruby])

Several libraries exist to make common GObject based bindings more Ruby-like   
Some niceness is built in mruby-girffi for GObject, Gtk >= 2.0, WebKit >= 1.0  
Typically when the Rubyifcation of an api goes out the scope of core mruby-girffi I create these. 

Thus far:  
* [mruby-glib2][mrb-glib2]
* [mruby-gobject][mrb-gobject]
* [mruby-gtk2][mrb-gtk2]
* [mruby-gtk3][mrb-gtk3]
* [mruby-webkit-1][mrb-webkit-1]
* [mruby-webkit-3][mrb-webkit-3]

Requirements
===
MRBGEMS:  
* [mruby-cfunc][cfunc]                   CFunc implementation for mruby  
* [mruby-rubyffi-compat][mrb-ffi]        A CRuby FFI compatable FFI implemention for mruby.  
* [mruby-gobject-introspection][mrb-gir] Bindings to [libgirepository][gir]  
* [mruby-allocate][alloc]                Provides `Class#allocate`  
* [mruby-named-constants][nc]            Constants via `const_set(:Foo,Class.new)` returns the constant name for `inspect`

Libraries:  
* [libgirepository][gir]     Allows to introspect `GObject` based libraries  
* [libglib][glib]            GLib  
* [libgobject][gobject]      The GObject type system  

Data:
* GIRepository Typelibs for the bindings you wish to use.

Example
===
```ruby
GirFFI.setup :Gtk #, [2.0, 3.0][1] # specify a version

Gtk::init(1,["MRuby-GirFFI Application"])

w = Gtk::Window.new(Gtk::WindowType::TOPLEVEL)
w.add b=Gtk::Button.new_from_stock(Gtk::STOCK_QUIT)

b.signal_connect "clicked" do |widget, data_always_nil|
  Gtk::main_quit
end

w.show_all()

Gtk::main()
```

Features
===
* Built in enhancements for `GObject`, `Gtk` and `WebKit`
* Ruby style method invokation. `(self, string_required, may_be_null, callback, out_param)` becomes `(string, *o, &b)`.
* Instantly write applications using the latest GObject based libraries. (nightly builds, even your own, if you compile your own typelibs)
* Generate documentation for built libraries with [mruby-girffi-docgen][mrb-girffi-docgen]

Cons
===
* A slight smell of `C` is left over
* Differences compared to the CRuby Gtk2 official bindings (method arguments order may differ. Constant naming conventions may differ)

TESTS
===
One needs girepository dev files  
This builds the Regress-1.0 library  
```sh
# build the test library, etc, and run
# gnerated files go to ./tmp
# expects mruby root to be one level above current dir
# ie: ../mruby
make test

# clean
make clean
```

TODO
===
* Makes no attempt to manage memory  
  Some will be implemented, but limited to instructions in typelibs.


Authors
===
ppibburr tulnor33@gmail.com

LICENSE
===
MIT
