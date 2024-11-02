fu! s:setup()
ruby << RUBY
class NyaoList
  attr_accessor :els, :i

  def initialize els=[]
    @els = els
    @i = 0
  end

  def <<(el)
    @els << el
  end

  def concat(other_els)
    @els.concat other_els
  end

  def add_current_file
    self << Ev.expand("%")
  end

  def godo cmd=nil
    cmd = Ev.input("cmd: ") unless cmd
    els.each do |path|
      w
      Ex.edit path
      Ex[cmd]
      w
    end
  end

  def macro_each
    els.each do |path|
      w
      Ex.edit path
      N["1gg@q"]
      w
    end
  end

  private
  def w
    Ex.silent 'write'
  end
end

$nyao_list = NyaoList.new unless $nyao_list

doc_path = Ev.expand('<sfile>:h:h') + 'doc/'
Ex['silent! exe "helptags '+doc_path+'"']
RUBY
endfu

call s:setup()

if exists('g:nyao_always_add_mappings') && g:nyao_always_add_mappings
  nno ,1 :ruby $nyao_list.add_current_file<CR>
  nno ,@ :ruby $nyao_list.macro_each<CR>
  nno ,: :ruby $nyao_list.godo<CR>
endif
