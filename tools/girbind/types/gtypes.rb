#
# -File- girbind/types/gtypes.rb
#

module GirBind
  GB_TYPES = {:string=>:string,
      :int=>:int,
      :int8=>:int8,
      :int16=>:int16,
      :int32=>:int32,
      :int64=>:int64,
      :double=>:double,
      :long=>:long,
      :char => :int8,
      :uchar => :uint8,
      :uint=>:uint,
      :uint8=>:uint8,
      :uint16=>:uint16,
      :uint32=>:uint32,
      :uint64=>:uint64,
      :double=>:double,
      :pointer=>:pointer,
      :void=>:void,
      :func=>:pointer,
      :error=>:pointer,
      :destroy=>:pointer,
      :data=>:pointer,
      :self=>:pointer,
      :bool=>:bool,
      :utf8=>:string,
      :short=>:short,
    :gboolean=>:bool,
    :guint=>:uint,
    :guint8=>:uint8,
    :guint32=>:uint32,
    :guint16=>:uint16,
    :gint64=>:int64,
    :glong=>:long,
    :gulong=>:ulong,
    :gshort=>:short,
    :gushort=>:ushort,
    :gchar=>:char,
    :guchar=>:uchar,
    :goffset=>:int64,
    :gsize=>:ulong,
    :utf8=>:string,
    :interface=>:pointer,
    :gint8=>:int8,
    :gint16=>:int16,
    :gint=>:int,
    :gint32=>:int32,
    :gdouble=>:double,
    :gpointer=>:pointer,
    :filename=>:string,
    :gunichar=>:uint,
    :object=>:pointer
      }
end
