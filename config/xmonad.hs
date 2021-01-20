import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.Gaps
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig ( additionalKeys )

main :: IO ()
main = launch myConfig
  where myConfig = desktopConfig
          { terminal = "alacritty"
          , focusedBorderColor = "#e53935"
          , borderWidth = 2
          , layoutHook =
            spacingRaw
               False
               (Border 0 10 10 10)
               False
               (Border 10 10 10 10)
               True
             $ gaps [(d, 10) | d <- [U, D, L, R]]
             $ layoutHook desktopConfig
          , startupHook = do
              startupHook desktopConfig
              mapM_ spawn
                [ "nitrogen --restore --set-zoom-fill &"
                ]
          }
          `additionalKeys`
          [ ((mod4Mask, xK_q), restart "xmonad" True)
          , ((mod1Mask, xK_p), spawn "rofi -modi \"window,run,ssh,combi\" -show combi")
          , ((mod1Mask .|. shiftMask, xK_q), spawn "betterlockscreen -l dimblur -t'Enter password to unlock'")
          ]  
