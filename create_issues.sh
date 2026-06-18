#!/bin/bash

# Array of issue data: "title|body|labels"
issues=(
"🐛 Components not rendering correctly on Safari|## Problem\nSome React components have rendering issues on Safari browsers.\n\n## Impact\n- 25% of users affected (Safari users)\n- Layout breaks in POS terminal\n- Buttons not clickable\n\n## Steps to Reproduce\n1. Open app in Safari\n2. Navigate to POS terminal\n3. Try to add products\n\n## Expected vs Actual\n- Expected: Normal component rendering\n- Actual: Distorted layout and broken buttons\n\n## Solution\n- Add Safari-specific CSS fixes\n- Test cross-browser compatibility\n- Update vendor prefixes|bug,high-priority,ui"

"✨ Add voice commands for accessibility|## Feature Request\nImplement voice control for hands-free POS operation.\n\n## User Story\nAs a cashier with mobility limitations, I want to use voice commands so that I can operate the POS without using hands.\n\n## Acceptance Criteria\n- [ ] Voice recognition for basic commands\n- [ ] 'Add product [name]' command\n- [ ] 'Complete transaction' command\n- [ ] 'Cancel order' command\n- [ ] Audio feedback for confirmations\n\n## Business Value\n- Improved accessibility\n- Faster operations during busy periods\n- Compliance with ADA requirements\n\n## Technical Notes\n- Use Web Speech API\n- Fallback for unsupported browsers\n- Privacy considerations for voice data|enhancement,accessibility,high-priority"

"🔒 Implement session timeout with warning|## Security Enhancement\nAdd automatic session timeout with user warning.\n\n## Requirements\n- 30-minute idle timeout\n- 5-minute warning before timeout\n- Modal dialog with extend/logout options\n- Save draft data before logout\n\n## Security Benefits\n- Prevent unauthorized access\n- Protect sensitive POS data\n- Compliance with security standards\n\n## Implementation\n- Activity detection\n- Countdown timer\n- Local storage cleanup\n- Graceful session handling|security,enhancement,medium-priority"

"⚡ Optimize dashboard loading performance|## Performance Issue\nDashboard takes 3+ seconds to load on slower devices.\n\n## Current Metrics\n- Load time: 3.2s average\n- First contentful paint: 1.8s\n- Largest contentful paint: 3.5s\n\n## Target Metrics\n- Load time: <1.5s\n- First contentful paint: <1s\n- Largest contentful paint: <2s\n\n## Optimization Strategy\n- Lazy load chart components\n- Implement skeleton screens\n- Optimize API calls\n- Add service worker caching\n- Bundle size reduction|performance,high-priority,dashboard"

"🎨 Dark mode toggle not persisting|## Bug Description\nDark mode preference resets after page refresh.\n\n## Impact\n- Poor user experience\n- Users need to re-enable dark mode\n- Affects night shift workers\n\n## Root Cause\n- Theme preference not saved to localStorage\n- No system theme detection\n- Missing persistence logic\n\n## Solution\n- Save theme to localStorage\n- Detect system preference\n- Apply theme before component mount\n- Add smooth transitions|bug,ui,medium-priority"

"📱 Add offline mode support|## Feature Request\nEnable POS functionality when internet is unavailable.\n\n## Use Case\nDuring internet outages, the POS should continue basic operations and sync when connection returns.\n\n## Requirements\n- [ ] Cache product catalog locally\n- [ ] Store transactions offline\n- [ ] Queue payments for later processing\n- [ ] Offline indicator in UI\n- [ ] Background sync when online\n- [ ] Conflict resolution for data\n\n## Technical Implementation\n- Service Worker for caching\n- IndexedDB for offline storage\n- Background sync API\n- Conflict detection and resolution|enhancement,offline,high-impact"

"🔍 Search functionality improvements|## Enhancement Request\nImprove product search with better filters and suggestions.\n\n## Current Issues\n- Slow search response\n- No autocomplete suggestions\n- Limited filter options\n- Poor relevance ranking\n\n## Proposed Improvements\n- [ ] Real-time search suggestions\n- [ ] Fuzzy matching for typos\n- [ ] Category-based filters\n- [ ] Barcode search integration\n- [ ] Search history\n- [ ] Advanced filtering options\n\n## User Impact\n- Faster product lookup\n- Reduced checkout time\n- Better user experience|enhancement,search,medium-priority"

"🐛 Transaction history export fails for large datasets|## Bug Report\nExport functionality crashes when exporting >1000 transactions.\n\n## Error Details\n```\nRangeError: Maximum call stack size exceeded\n  at generateCSV (export.ts:45)\n  at handleExport (TransactionHistory.tsx:123)\n```\n\n## Impact\n- Cannot export monthly reports\n- Affects business reporting\n- Causes browser crashes\n\n## Reproduction Steps\n1. Navigate to Transaction History\n2. Select date range with >1000 transactions\n3. Click 'Export to CSV'\n4. Browser crashes or shows error\n\n## Solution\n- Implement chunked processing\n- Add progress indicator\n- Use Web Workers for heavy operations\n- Optimize memory usage|bug,high-priority,export"

"✨ Multi-language support for international users|## Feature Request\nAdd internationalization (i18n) support for multiple languages.\n\n## Business Case\n- Expanding to international markets\n- 40% of potential users prefer non-English interface\n- Competitive advantage in global markets\n\n## Supported Languages (Priority)\n1. Spanish (ES)\n2. French (FR)\n3. Portuguese (PT)\n4. Arabic (AR)\n5. Chinese (ZH)\n\n## Implementation Requirements\n- [ ] React-i18n integration\n- [ ] Translation files for each language\n- [ ] RTL support for Arabic\n- [ ] Currency formatting per locale\n- [ ] Date/time formatting\n- [ ] Language switcher in settings\n\n## Considerations\n- Professional translations needed\n- Cultural adaptations required\n- Testing with native speakers|enhancement,i18n,high-impact"

"🔐 Add two-factor authentication|## Security Enhancement\nImplement 2FA for enhanced account security.\n\n## Requirements\n- [ ] TOTP support (Google Authenticator, Authy)\n- [ ] SMS backup option\n- [ ] Recovery codes generation\n- [ ] Force 2FA for admin accounts\n- [ ] Remember device option\n- [ ] 2FA setup wizard\n\n## Security Benefits\n- Protection against credential theft\n- Enhanced compliance posture\n- Reduced security incidents\n- Customer trust improvement\n\n## User Experience\n- Simple setup process\n- Clear instructions\n- Graceful fallbacks\n- Emergency access methods|security,authentication,high-priority"

"📊 Add real-time sales analytics|## Feature Request\nImplement live sales tracking and analytics dashboard.\n\n## Requirements\n- [ ] Real-time sales counter\n- [ ] Live transaction feed\n- [ ] Hourly/daily sales charts\n- [ ] Top-selling products widget\n- [ ] Revenue tracking\n- [ ] Customer analytics\n- [ ] Performance comparisons\n\n## Technical Implementation\n- WebSocket connection for real-time data\n- Chart.js or similar for visualizations\n- Efficient data aggregation\n- Responsive chart design\n\n## Business Value\n- Data-driven decision making\n- Real-time business insights\n- Performance monitoring\n- Trend identification|enhancement,analytics,dashboard"

"🐛 Memory leak in transaction components|## Performance Bug\nMemory usage increases over time when viewing transactions.\n\n## Symptoms\n- Browser becomes slow after 1 hour\n- High memory usage (>500MB)\n- Eventually causes browser crash\n- Affects long POS sessions\n\n## Investigation\n- Event listeners not cleaned up\n- React components not unmounting properly\n- WebSocket connections accumulating\n- Timer functions not cleared\n\n## Solution\n- Add proper cleanup in useEffect\n- Implement component unmounting\n- Fix WebSocket connection management\n- Add memory monitoring tools|bug,performance,memory"

"✨ Add receipt customization options|## Feature Request\nAllow merchants to customize receipt templates and branding.\n\n## Current State\n- Fixed receipt template\n- No branding options\n- Limited customization\n\n## Requested Features\n- [ ] Custom logo upload\n- [ ] Editable header/footer text\n- [ ] Multiple receipt templates\n- [ ] Color scheme customization\n- [ ] Font selection\n- [ ] Additional fields (tax ID, etc.)\n- [ ] Preview functionality\n\n## Business Impact\n- Better brand consistency\n- Professional appearance\n- Merchant satisfaction\n- Competitive differentiation|enhancement,receipts,branding"

"🔧 Update to latest React and dependencies|## Maintenance Task\nUpgrade React and other dependencies to latest stable versions.\n\n## Current Versions\n- React: 18.2.0\n- TypeScript: 5.2.2\n- Vite: 5.0.0\n\n## Target Versions\n- React: 18.3.0+\n- TypeScript: 5.3.0+\n- Vite: 5.1.0+\n\n## Benefits\n- Security patches\n- Performance improvements\n- New features access\n- Bug fixes\n\n## Migration Steps\n- [ ] Update package.json\n- [ ] Run compatibility tests\n- [ ] Fix breaking changes\n- [ ] Update documentation\n- [ ] Verify all functionality|maintenance,dependencies"

"📱 Improve mobile responsiveness|## UI Enhancement\nOptimize interface for mobile and small tablet screens.\n\n## Current Issues\n- POS interface not mobile-friendly\n- Touch targets too small\n- Text not readable on small screens\n- Navigation difficult on mobile\n\n## Requirements\n- [ ] Mobile-first POS layout\n- [ ] Larger touch targets (44px minimum)\n- [ ] Readable typography scaling\n- [ ] Simplified mobile navigation\n- [ ] Gesture support (swipe, pinch)\n- [ ] Mobile-optimized forms\n\n## Testing\n- Test on actual devices\n- Various screen sizes\n- Different orientations\n- Touch interaction validation|enhancement,mobile,ui"
)

echo "Creating GitHub issues for StellarPOS Surface repository..."

count=1
for issue_data in "${issues[@]}"; do
  IFS='|' read -r title body labels <<< "$issue_data"
  
  gh issue create \
    --title "$title" \
    --body "$body" \
    --label "$labels" > /dev/null 2>&1
  
  if [ $? -eq 0 ]; then
    echo "✓ Created issue $count: $title"
  else
    echo "✗ Failed to create issue $count: $title"
  fi
  
  count=$((count + 1))
  sleep 0.3
done

echo ""
echo "🎉 Successfully created ${#issues[@]} GitHub issues!"
echo "📊 Issues created with comprehensive labels and detailed descriptions"