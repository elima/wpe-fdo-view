((prog-mode
  (indent-tabs-mode . nil)
  (tab-width . 8)
  (c-basic-offset . 3)
  (c-file-style . "stroustrup")
  (fill-column . 78)
  (eval . (progn
            (c-set-offset 'case-label '0)
            (c-set-offset 'innamespace '0)
            (c-set-offset 'inline-open '0)))
  )
 (makefile-mode (indent-tabs-mode . t))
 )
